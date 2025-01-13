import Tray from "gi://AstalTray";
import { bind } from "astal";
import { App, Gtk, Gdk } from "astal/gtk4";

//type BarTrayItemProps = {
//    item: Tray.TrayItem;
//
//}
//
//const BarTrayItem = ({ item }: BarTrayItemProps) => {
//    if (item.iconThemePath) {
//        App.add_icons(item.iconThemePath);
//    }
//
//    return (
//    );
//};


export default () => {
    const tray = Tray.get_default();

    return (
        <box spacing={4} hexpand={false} valign={Gtk.Align.CENTER}>
            {bind(tray, "items").as(items => {
                items.map(item => {
                    <box>
                        <menubutton
                            cssName="bar_tray-item"
                            tooltipMarkup={bind(item, "tooltipMarkup")}
                        >
                            <image gicon={bind(item, "gicon")} />
                        </menubutton>
                    </box>
                })
            })}
        </box>
    );
};
