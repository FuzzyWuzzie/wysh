package api;

import types.TProfile;
import api.APIResponse;

#if sys
import models.User;
import models.Friends;
import models.FriendRequests;
#end

@:allow(api.Profile)
class ProfileObject implements APIResponseObject {
    public var id:String;
    public var name:String;
    public var picture:Null<String>;

    private function new(profile:TProfile) {
        this.id = profile.id;
        this.name = profile.name;
        this.picture = profile.picture;
    }
}

@:forward
abstract Profile(ProfileObject) from ProfileObject to ProfileObject to APIResponse {
    public function new(profile:TProfile)
        this = new ProfileObject(profile);

    @:from
    public static inline function fromObj(profile:TProfile):Profile
        return new Profile(profile);

    @:to
    public inline function toObj():TProfile
        return {
            id: this.id,
            name: this.name,
            picture: this.picture
        };

#if sys
    @:from
    public static inline function fromDBUser(user:User):Profile
        return new Profile({
            id: Server.userHID.encode(user.id),
            name: user.name,
            picture: user.picture
        });

    @:from
    public static inline function fromDBFriend(friend:Friends):Profile
        return new Profile({
            id: Server.userHID.encode(friend.friendB.id),
            name: friend.friendB.name,
            picture: friend.friendB.picture
        });

    @:from
    public static inline function fromDBFriendRequest(request:FriendRequests):Profile
        return new Profile({
            id: Server.userHID.encode(request.requester.id),
            name: request.requester.name,
            picture: request.requester.picture
        });
#end
}
