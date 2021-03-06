package api;

import api.APIResponse;

@:allow(api.Token)
class TokenObject implements APIResponseObject {
    public var token:String;
    private function new(token:String)
        this.token = token;
}

@:forward
abstract Token(TokenObject) from TokenObject to TokenObject to APIResponse {
    public function new(token:String)
        this = new TokenObject(token);

    @:from
    public static function fromString(token:String):Token
        return new Token(token);
}
