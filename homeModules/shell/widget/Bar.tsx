import { Variable, GLib, bind } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk4"

function Time() {
    const format = "%H:%M"
    const time = Variable(new GLib.DateTime()).poll(1000, () => new GLib.DateTime());

    return <label
        className="Time"
        onDestroy={() => time.drop()}
        label={time(timestamp => timestamp.format(format))}
    />
}

export default function Bar(monitor = 0) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
    const data = "Test"

    print(data)
    return <window
        className="Bar"
        monitor={monitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}>
        <centerbox>
            <box hexpand halign={Gtk.Align.START}>
                <label label={data}/>
            </box>
            <box>
            </box>
            <box hexpand halign={Gtk.Align.END} >
                <Time />
            </box>
        </centerbox>
    </window>
}
