import { App } from "astal/gtk3";
import style from "./style.scss";
import Bar from "./widget/Bar";

App.start({
    css: style,
    instanceName: "js",
    main() {
        Bar(0);
        Bar(1);
    },
    requestHandler(request, res) {
        print(request)
        res("ok")
    },
})
