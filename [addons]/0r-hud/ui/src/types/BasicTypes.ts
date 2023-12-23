export type HexagonColors =
  | "gray"
  | "green"
  | "blue"
  | "orange"
  | "cyan"
  | "red"
  | "zinc"
  | "yellow"
  | "black"
  | "amber"
  | "emerald"
  | "purple"
  | "lime";

export type HexagonBarProps = {
  color?: HexagonColors;
  children?: React.ReactNode;
  occupancy?: number;
  hidden?: boolean;
  noAnim?: boolean;
};

export type SettingsPagesProps = "hud" | "help_guides" | "map" | "pause_menu";
