## マンメモ　v2

### 機能要件

- 友達の基本情報を記録できる。
- 日記をMarkdownで記録できる。
- カレンダーから友人の誕生日や日記を確認できる。

### システム設計

![](https://storage.googleapis.com/zenn-user-upload/11a0538e066e-20220928.png)


| レイヤー名　  | 機能 |
|  ----     | ---- |  
| app       | 基本設定, 環境変数 |
| domain    |  ビジネスロジック・Entity定義  |  
| infrastructure      |  外部サービス連携  |
| presentation |  ユーザによる操作イベント処理<br>状態管理・ビューデータ管理<br>画面表示・ユーザによる操作イベント発信   | 




### 1. Domain
ビジネスロジックを表現するオブジェクトやエンティティなどが存在しています。
Domainは最も依存性が高い所に位置するレイヤーであり、アプリの主要部分になります。
本アプリでは、infrastructureまたpresentation層へのインターフェースもこのレイヤーで定義しています。

#### Use case
UseCaseではビジネスルールのインターフェースを定義しています。
同階層でInputData・OutputDataのインターフェースも定義しています。
PresenterはUseCaseを介してドメイン層にアクセスします。

```dart
abstract class UseCase<InputData, OutputData> {
  OutputData handle(InputData input);
}
```

### 2. Presentation
Presentationレイヤーは情報や画像などを画面に表示する処理と、ユーザーからのインタラクションを受け付ける処理を担当します。


### Presenters
PresentersはUseCaseで受け取ったEntityデータをViewModelに加工することを主な目的とします。

```dart
class Presenter {
    final Transformer transformer;
    final UseCase _usecase;
    
    Future<ViewModel> handle() async {
        final input = Input();
        final output = _usecase.handle(input);
        ...
        return transformer.translate(output);
}
```

### Provider
ProviderではUIに表示するStateの管理とPresenterを介してユーザーからのイベント処理をドメイン層に伝える役割を持ちます。
ViewModelの実装もこのディレクトリで行っています。
StateはViewModelを参照しStateNotifierで実装することで、UIからのイベントに応じたStateの変化を検知し、データの更新を行なったViewModelをUIに渡します。


```dart
/// State provider
final usersNotifierProvider =
    StateNotifierProvider<UsersNotifier, AsyncValue<List<UserModel>>>((ref) {
  return UsersNotifier(
    ref,
    ref.watch(userPresenterProvider),
  )..initialize();
});

/// State
class UsersNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  UsersNotifier(this.ref, this.presenter)
      : super(const AsyncValue<List<UserModel>>.loading());

  final Ref ref;
  final UsersPresenter presenter;

  Future<void> initialize() async {
    final users = await presenter.fetchAll();
    state = AsyncValue.data(users);
  }
  ...
}
```

### Widgets
受け取ったデータを画面に表示します。
本アプリでは役割に応じてWidgetsを二つに分割し開発しています。
Providerに依存しないComponentを利用することでWidgetテストを容易にします。

- Component: Containerから受け取ったデータを使ってUIを構築します。Containerを介してデータにアクセスするため状態に依存しません。最も低いレイヤーに位置します。
- Container: Providerから受け取ったデータをComponentに提供します。ConsumerWidgetで定義。

### 3. Infrastructure
Domainレイヤーがデータベースにアクセスするための機能を提供します。

### Repository
```dart
class UsersRepositoryImpl implements UsersRepository {
  final UsersDatabase usersDatabase;

  UsersRepositoryImpl(this.usersDatabase);

  @override
  Future<UserEntity> add(UserEntity entity) async {
    final data = await usersDatabase.create(UserData.fromEntity(entity));
    return data.toEntity();
  }

  @override
  Future<UserEntity> get(int id) async {
    final data = await usersDatabase.readUser(id);
    return data.toEntity();
  }

  @override
  Future<List<UserEntity>> fetchAll() async {
    final datas = await usersDatabase.readAllUsers();
    return datas.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<UserEntity>> search(String searchText) async {
    final datas = await usersDatabase.readAllUsers();
    return datas.map((e) => e.toEntity()).toList();
  }
}
```

RepositoryはDomainレイヤーで定義されたRepositoryインターフェースを実装し、
DomainレイヤーがEntity内の永続化すべきオブジェクトを利用できるようにします。
クライアントの環境に応じてアクセスする外部リソースを切り替えます。


### Datasources
Datasourcesでは外部リソースの操作を行います。
以前のバージョンではデータベースにFirebaseのみ利用していましたが、v２.0.0ではローカルデータベースでのデータ操作を追加します。
