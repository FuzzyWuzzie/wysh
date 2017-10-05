package api;

import api.APIResponse;

@:allow(api.Lists)
class ListsObject implements APIResponseObject {
    public var lists:Array<List>;

    private function new(lists:Array<List>) {
        this.lists = lists;
    }
}

abstract Lists(ListsObject) from ListsObject to APIResponse {
    public function new(lists:Array<List>)
        this = new ListsObject(lists);

    @:from
    public static inline function fromDB(lists:Iterable<models.List>):Lists
        return new Lists([for(list in lists) list]);
}
