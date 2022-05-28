db.createUser(
    {
        user: "projectname",
        pwd: "MONGODB_PASSWORD",
        roles: [
            {
                role: "readWrite",
                db: "subbu_shop"
            }
        ]
    }
);
