import { Variable, GLib, exec } from "astal";
import { Astal, Gtk, Gdk } from "astal/gtk4";
import Gio from "gi://Gio?version=2.0";

import Workspaces from "./workspaces";
import Tray from "./tray";

const powermenu = new Gio.Menu();
powermenu.append("Suspend", "powermenu.suspend");
powermenu.append("Shutdown", "powermenu.shutdown");
powermenu.append("Reboot", "powermenu.reboot");

const suspendAction = new Gio.SimpleAction({ name: "suspend" });
suspendAction.connect("activate", () => exec("systemctl suspend"));
const shutdownAction = new Gio.SimpleAction({ name: "shutdown" });
shutdownAction.connect("activate", () => exec("systemctl poweroff"));
const rebootAction = new Gio.SimpleAction({ name: "reboot" });
rebootAction.connect("activate", () => exec("systemctl reboot"));

const powermenuGroup = new Gio.SimpleActionGroup();
powermenuGroup.add_action(suspendAction);
powermenuGroup.add_action(shutdownAction);
powermenuGroup.add_action(rebootAction);

const PowerButton = () => (
    <menubutton
        name="power-button"
        menuModel={powermenu}
        setup={(self) => self.insert_action_group("powermenu", powermenuGroup)}
    >
        <image iconName="system-shutdown-symbolic" />
    </menubutton>
);


function SystemIcon() {
    return <box>
        <image
            file="/home/henning/.shellAssets/nixos.svg"
        />
    </box>
}

function Time({ }) {
    const format = "%H:%M"
    const time = Variable(new GLib.DateTime()).poll(1000, () => new GLib.DateTime());
    return <box>
        {time(timestamp => timestamp.format(format))}
    </box>
}

export default function Bar(monitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        cssClasses={["bar"]}
        gdkmonitor={monitor}
        visible={true}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}>
        <centerbox>
            <box hexpand halign={Gtk.Align.START}>
                <SystemIcon />
                <Workspaces />
            </box>
            <box>
                <Tray />
                <Time />
            </box>
            <box hexpand halign={Gtk.Align.END} >
                <PowerButton />
            </box>
        </centerbox>
    </window>
}
