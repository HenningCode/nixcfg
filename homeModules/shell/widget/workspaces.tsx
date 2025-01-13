import { bind, Binding, Variable } from "astal";
import { Gdk, Gtk, Widget, hook } from "astal/gtk4";
import AstralHyprland from "gi://AstalHyprland";
import { range } from "../utils";

export default () => {
    const hypr = AstralHyprland.get_default();
    const ws: number = 10;

    const focusWorkspace = (workspaceId: number) =>
        hypr.dispatch("workspace", workspaceId.toString());


    return <box spacing={8} cssName="workspaces">
        {range(ws).map(i => {
            return (
                <button
                    valign={Gtk.Align.CENTER}
                    cssClasses={bind(hypr, "focusedWorkspace").as(fw =>
                        i == fw.id ? ["workspace", "active"] : ["workspace"])}
                    onClicked={() => focusWorkspace(i)}
                >
                </button>
            );
        })}
    </box>
};
