module.exports = {
    default: {
        require: ["steps/*.ts"],
        paths: ["features/*.feature"],
        requireModule: ["ts-node/register"],
    },
};
