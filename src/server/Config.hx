package;

typedef Config = {
    public var port:Int;
    public var enableCORS:Bool;
    public var serveStatic:Bool;

    public var log:{
        public var level:String;
        public var requests:Bool;
    };

    public var root:{
        public var client:String;
        public var api:String;
    };

    public var uploads:{
        public var savePath:String;
        public var pathPrefix:String;
    };

    public var oauth2:{
        public var google:{
            public var id:String;
            public var secret:String;
        };
        public var facebook:{
            public var id:String;
            public var secret:String;
        };
    };

    public var hid:{
        public var minlength:Int;
        public var alphabet:String;
        public var salts:{
            public var user:String;
            public var list:String;
            public var item:String;
            public var uploads:String;
        }
    };

    public var jwt:{
        public var secret:String;
        public var duration:Float;
    };
};
