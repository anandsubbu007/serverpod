db.createUser(
    {
        user: "root",
        pwd: "MONGODB_PASSWORD",
        roles: [
            {
                role: "readWrite",
                db: "example"
            }
        ]
    }
);
