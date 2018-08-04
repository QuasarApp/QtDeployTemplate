// Constructor
function Component()
{

    generateTr();
}

function generateTr() {
    component.setValue("DisplayName", qsTr("App"));
    component.setValue("Description", qsTr("Install App"));

}

function isNoEmpty(dir){
    var libsArray = installer.findPath("*", [dir]);
    return Boolean(libsArray.length);
}
