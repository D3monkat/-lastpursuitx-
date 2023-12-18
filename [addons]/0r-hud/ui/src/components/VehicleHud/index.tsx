import { BsFuelPumpFill } from "react-icons/bs";
import { FaGear } from "react-icons/fa6";
import useData from "../../hooks/useData";
import classNames from "classnames";
import "./index.sass";

export const VehicleHud = () => {
  const { vehicleHud } = useData();
  const iRpm = 18;

  return (
    <>
      {!vehicleHud?.hidden && vehicleHud?.show && !vehicleHud.isPassenger && (
        <div className="flex gap-2 justify-between">
          <div className="w-[120px]">
            <div className="flex flex-col gap-1 relative bottom-1.5">
              <div
                hidden={vehicleHud?.isSeatbeltOn}
                className="absolute -top-8"
              >
                <div className="w-7 h-7 animate-pulse">
                  <img src="images/seat-belt.svg" alt="seat-belt" />
                </div>
              </div>
              <div>
                <h1 className="text-white/60 font-semibold font-mono float-right">
                  {vehicleHud?.kmH ? "KMH" : "MPH"}
                </h1>
              </div>
              <div>
                <div className="flex items-center justify-between gap-1 -mb-1">
                  <div className="py-0.5 px-2 border border-gray-300 bg-super_green shadow-super_green shadow-[0px_0px_4px_0px]">
                    <div className="items-center font-medium text-base">
                      <h1 className="text-x_green font-bold">
                        {vehicleHud?.gear}
                      </h1>
                      <FaGear className="text-x_green w-2.5 h-2.5 mb-1" />
                    </div>
                  </div>
                  <div>
                    <h1
                      className={`text-5xl tracking-wider mb-1 speed ${
                        vehicleHud?.speed === 0 ? "text-zinc-700" : "text-white"
                      }`}
                    >
                      {Array.from(
                        vehicleHud?.speed.toString().padStart(3, "0")
                      ).map((digit, index) => (
                        <span
                          key={index}
                          className={
                            vehicleHud?.speed === 0
                              ? "text-zinc-700"
                              : index < 3 - vehicleHud?.speed.toString().length
                              ? "text-zinc-700"
                              : ""
                          }
                        >
                          {digit}
                        </span>
                      ))}
                    </h1>
                  </div>
                </div>
              </div>
              <div className="mt-1">
                <ul className="flex justify-between">
                  {[...Array(iRpm)].map((_, i) => (
                    <li
                      key={i}
                      className={classNames(
                        "w-1 h-6 bg-[#2a2f30] rounded transition-all duration-200",
                        {
                          "!bg-super_green shadow-super_green shadow-[0px_0px_2px_0px] animate-rpm":
                            i < 16 && i <= Math.round(vehicleHud.rpm * 16) + 1,
                        },
                        {
                          "!bg-red-800 shadow-red-900 shadow-[0px_0px_2px_0px] animate-rpm animate-rpmbounce":
                            i >= 16 && i <= Math.round(vehicleHud.rpm * 16) + 1,
                        },
                        {
                          "delay-500":
                            i == 18 && i <= Math.round(vehicleHud.rpm * 16) + 1,
                        }
                      )}
                    />
                  ))}
                </ul>
              </div>
            </div>
          </div>
          <div>
            <div className="flex flex-col items-center gap-1">
              <div>
                <BsFuelPumpFill className="text-white w-3 h-3" />
              </div>
              <div>
                <div className="w-1.5 h-[5.5rem] rounded-sm bg-gray-700/10 flex flex-col-reverse mr-1">
                  <div
                    className="bg-white w-full rounded-sm"
                    style={{ height: vehicleHud?.fuel.level + "%" }}
                  ></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </>
  );
};
