package pages;

import js.Error;
import mithril.M;
import stores.AuthStore;
import stores.ProfilesStore;

class Login implements Mithril {
    public function new(){}

    public function onmatch(params:haxe.DynamicAccess<String>, url:String) {
        AuthStore.authenticate(params.get('token'))
        .then(function(_) {
            return ProfilesStore.fetchProfile(Client.store.state.auth.uid);
        })
        .catchError(function(error:Error) {
            Client.console.error(error);
        });

        M.routeSet('/');
        return null;
    }

    public function render(vnode) {
        return m('p', 'Logged in!');
    }
}