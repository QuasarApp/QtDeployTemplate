// Constructor
function Component()
{

    generateTr();
}

function generateTr() {
    component.setValue("DisplayName", qsTr("Virtus Rlo Images"));
    component.setValue("Description", qsTr("This package contains images for the sidebar of the rolo mode"));

}

function isNoEmpty(dir){
    var libsArray = installer.findPath("*", [dir]);
    return Boolean(libsArray.length);
}
