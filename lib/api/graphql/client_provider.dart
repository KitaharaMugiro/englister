import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

const bool ENABLE_WEBSOCKETS = true;

ValueNotifier<GraphQLClient> clientFor() {
  final HttpLink _httpLink = HttpLink(
    'https://adequate-guinea-56.hasura.app/v1/graphql',
  );

  // Github tokens
  final AuthLink _authLink = AuthLink(getToken: () => 'aaa', headerKey: 'aaa');

  var _link = _authLink.concat(_httpLink);

  if (ENABLE_WEBSOCKETS) {
    // final websocketLink = WebSocketLink('ws://localhost:8080/v1/graphql',
    final websocketLink =
        WebSocketLink('wss://adequate-guinea-56.hasura.app/v1/graphql',
            config: SocketClientConfig(initialPayload: {
              "headers": {"content-type": "application/json"}
            }));

    _link = Link.split(
      (request) => request.isSubscription,
      websocketLink,
      _link,
    );
  }

  return ValueNotifier<GraphQLClient>(GraphQLClient(
    cache: GraphQLCache(
      store: HiveStore(),
    ),
    link: _link,
  ));
}

/// Wraps the root application with the `graphql_flutter` client.
/// We use the cache for all state management.
class ClientProvider extends StatelessWidget {
  ClientProvider({
    @required this.child,
  }) : client = clientFor();

  final Widget child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: child,
    );
  }
}
