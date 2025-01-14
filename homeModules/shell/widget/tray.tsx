import Tray from "gi://AstalTray";
import { property, register } from "astal/gobject";
import { bind } from "astal";
import { App, Gtk, G:WakeLocukdk } from "astal/gtk4";

type BarTrayItemProps = {
    item: Tray.TrayItem;

}
// TODO: try astalifying this
@register()
class TrayButton extends Gtk.Button {
    private declare _menuModel: Gio.MenuModel;
    private declare _actionGroup: Gio.ActionGroup;

    @property(Gio.MenuModel)
    get menuModel() {
        return this._menuModel;
    }
    set menuModel(v: Gio.MenuModel) {
        this._menuModel = v;
        if (this.popover) {
            this.popover.menuModel = v;
        }
    }

    @property(Gio.ActionGroup)
    get actionGroup() {
        return this._actionGroup;
    }
    set actionGroup(v: Gio.ActionGroup) {
        this._actionGroup = v;
        if (this.popover) {
            // This removes it if it already exists.
            // I checked the source code.
            this.popover.insert_action_group("dbusmenu", v);
        }
    }

    private popover: Gtk.PopoverMenu;

    constructor(constructProperties = {}) {
        super(constructProperties);
        this.popover = Gtk.PopoverMenu.new_from_model(this.menuModel);
        this.popover.flags = Gtk.PopoverMenuFlags.NESTED;
        this.popover.insert_action_group("dbusmenu", this.actionGroup);
        // Doing this in `vfunc_root` REALLY breaks things.
        this.popover.set_parent(this);
    }

    activate_popover() {
        this.popover.popup();
    }

    vfunc_unroot() {
        // Overriding `vfunc_dispose` breaks things.
        // I think this is a GJS issue? This is supposed to go in `dispose`
        // Or I just don't understand it well enough.
        // https://discourse.gnome.org/t/gtk4-gtkpopover-finalizing-warning/25881/3
        // https://discourse.gnome.org/t/how-to-not-destroy-a-widget/7449/5
        this.popover.unparent();
        super.vfunc_unroot();
    }
}

const BarTrayItem = ({ item }: BarTrayItemProps) => {
    if (item.iconThemePath) {
        App.add_icons(item.iconThemePath);
    }
    return (
        <box>
            <button
                cssName="bar_tray-item"
                tooltipMarkup={bind(item, "tooltipMarkup")}
                
            >
                <image gicon={bind(item, "gicon")} />
            </button>
        </box>
    );
};


export default () => {
    const tray = Tray.get_default();

    return (
        <box spacing={4} hexpand={false} valign={Gtk.Align.CENTER}>
            {bind(tray, "items").as(items => {
                return items.map(item => {
                    if (item.iconThemePath) {
                        App.add_icons(item.iconThemePath);
                    }
                    return <BarTrayItem item={item} />;

                })
            })}
        </box>
    );

};
