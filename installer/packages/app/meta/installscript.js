// Constructor
function Component()
{

    generateTr();
}

function generateTr() {
    component.setValue("DisplayName", qsTr("Virtus Rlo Images"));
    component.setValue("Description", qsTr("This package contains images for the sidebar of the rolo mode"));

}


// Utility function like QString QDir::toNativeSeparators(const QString & pathName) [static]
var Dir = new function () {
    this.toNativeSparator = function (path) {
        if (installer.value("os") === "win")
            return path.replace(/\//g, '\\');
        return path;
    }
};

var assert = function(message) { 
    throw new Error("Assert failed" + (typeof message !== "undefined" ? ": " + message : ""));
};

function isNoEmpty(dir){
    var libsArray = installer.findPath("*", [dir]);
    return Boolean(libsArray.length);
}
