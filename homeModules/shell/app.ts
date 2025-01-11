import { App, Gdk, Gtk } from "astal/gtk4";
import Bar from "./widget/Bar";


App.start({
    main() {
        Bar(0)
    }
})
