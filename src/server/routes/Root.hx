package routes;

import tink.http.Response.ResponseHeader;
import tink.http.Response.OutgoingResponse;
import tink.web.routing.*;

class Root {
    public function new() {}

    @:restrict(user.id == 42)
    @:sub public function lists() {
        return new Lists();
    }
}