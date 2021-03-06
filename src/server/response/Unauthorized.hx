package response;

import tink.http.Response.ResponseHeader;
import tink.http.Response.OutgoingResponse;
import tink.web.routing.Response;

abstract Unauthorized(Response) from Response to Response {
    public inline function new()
        this = new OutgoingResponse(
            new ResponseHeader(401, 'Unauthorized', null),
            ''
        );
}