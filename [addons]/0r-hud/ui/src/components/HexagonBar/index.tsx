import classNames from "classnames";
import "./index.sass";
import { HexagonBarProps } from "../../types/BasicTypes";

export const HexagonBar: React.FC<HexagonBarProps> = ({
  color,
  children,
  occupancy,
  hidden,
  noAnim,
}) => {
  color = color ?? "gray";

  const hexagonColor = {
    gray: "bg-gray-500/30",
    green: "bg-green-500/40",
    blue: "bg-blue-700/50",
    orange: "bg-orange-400/40",
    cyan: "bg-cyan-500/40",
    red: "bg-red-500/40",
    zinc: "bg-zinc-300/40",
    black: "bg-black/40",
    yellow: "bg-yellow-500/40",
  };
  const smallHexagonColor = {
    gray: "bg-gray-200/80",
    green: "bg-green-500/80",
    blue: "bg-blue-500/80",
    orange: "bg-orange-300/80",
    cyan: "bg-cyan-300/80",
    red: "bg-red-600/80",
    zinc: "bg-zinc-400/80",
    black: "bg-black/80",
    yellow: "bg-yellow-300/80",
  };
  const inheritColor = {
    gray: "bg-gray-700",
    green: "bg-green-700",
    blue: "bg-blue-950",
    orange: "bg-orange-400",
    cyan: "bg-cyan-500",
    red: "bg-red-800",
    zinc: "bg-zinc-300",
    black: "bg-black",
    yellow: "bg-yellow-500",
  };
  const animAftColor = {
    gray: "after:bg-gray-700",
    green: "after:bg-green-700",
    blue: "after:bg-blue-950",
    orange: "after:bg-orange-400",
    cyan: "after:bg-cyan-500",
    red: "after:bg-red-800",
    zinc: "after:bg-zinc-500",
    black: "after:bg-black",
    yellow: "atar:bg-yellow-500",
  };

  const calculateHeight = (occ: any) => {
    return (35 * occ) / 100;
  };

  return (
    <div className="hexagon-container" hidden={hidden}>
      <div
        className={classNames(
          "hexagon flex items-center justify-center",
          hexagonColor[color]
        )}
      >
        <div className="icon">{children}</div>
        <div className={classNames("small-hexagon", smallHexagonColor[color])}>
          <div
            className={classNames(
              "inherit shadow-inner transition-height after:transition-height",
              inheritColor[color],
              animAftColor[color],
              { anim: !noAnim }
            )}
            style={{ height: `${calculateHeight(occupancy)}px` }}
          ></div>
        </div>
      </div>
    </div>
  );
};
