import useLocales from "../../hooks/useLocales";
import { HexagonColors } from "../../types/BasicTypes";

interface ColorSelectorProps {
  color: HexagonColors;
  handleOnChange: (event: React.ChangeEvent<HTMLSelectElement>) => void;
}

export const ColorSelector: React.FC<ColorSelectorProps> = ({
  color,
  handleOnChange,
}) => {
  const { locale } = useLocales();

  const hexagonColorValues: HexagonColors[] = [
    "gray",
    "green",
    "blue",
    "orange",
    "cyan",
    "red",
    "zinc",
    "yellow",
    "black",
    "amber",
    "emerald",
    "purple",
    "lime",
  ];

  const colorOptions: JSX.Element[] = [
    <option key="" value="" disabled>
      {locale.settings_text_color}
    </option>,
    ...Object.values(hexagonColorValues).map((colorOption) => (
      <option key={colorOption} value={colorOption}>
        {colorOption.charAt(0).toUpperCase() + colorOption.slice(1)}
      </option>
    )),
  ];

  return (
    <>
      <label htmlFor="colorSelector" className="sr-only">
        Color
      </label>
      <select
        id="colorSelector"
        className="bg-[#005e5d] text-white text-xs py-1.5 ring-0 outline-none"
        value={color}
        onChange={handleOnChange}
      >
        {colorOptions}
      </select>
    </>
  );
};
