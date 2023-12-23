import useData from "../../../hooks/useData";
import { IoHelp } from "react-icons/io5";

export const HelpGuides = () => {
  const { helpGuides } = useData();
  return (
    <div>
      {helpGuides.map((hg, i) => (
        <div className="mb-2 w-full">
          <div
            key={i}
            className="flex justify-start items-center gap-4 bg-[#393e50] p-2 px-4 text-start rounded"
          >
            <div className="p-2 bg-settings_green/20 rounded-full">
              <IoHelp className="h-6 w-6 text-settings_green" />
            </div>
            <div>
              <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
                {hg.title}
              </h1>
              <h1 className="text-sm font-[inherit] text-gray-400">
                {hg.description}
              </h1>
            </div>
          </div>
        </div>
      ))}
    </div>
  );
};
