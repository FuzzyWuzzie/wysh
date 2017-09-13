package;

import tink.CoreApi.Option;
import tink.CoreApi.Promise;
import tink.http.Request.IncomingRequestHeader;

class User {
    public var id(default, null):Int;
    public function new(id:Int) this.id = id;
}

class Session {
    var header:IncomingRequestHeader;

    public function new(header:IncomingRequestHeader) {
        this.header = header;
    }

    public function getUser():Promise<Option<User>> {
        return switch header.byName('authorization') {
            case Success(auth): {
                return Some(new User(42));
            }

            case Failure(e): e;
        }
    }
}