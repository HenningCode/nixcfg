import { App, Gdk, Gtk } from "astal/gtk4";
import style from "./style.scss";
import Bar from "./widget/bar";


App.start({
    css: style,
    main() {
        App.get_monitors().map((monitor) => Bar(monitor));
    }
})
