import { FaHeadSideCough } from "react-icons/fa";
import { RiHeart3Fill } from "react-icons/ri";
import { PiShieldFill } from "react-icons/pi";
import { PiHamburgerFill } from "react-icons/pi";
import { IoMdWater } from "react-icons/io";
import { RiBrainFill } from "react-icons/ri";
import { FaTerminal } from "react-icons/fa";
import { FaLeaf } from "react-icons/fa";
import { FaHeadphones } from "react-icons/fa6";
import { HexagonBar } from "../HexagonBar";
import { SiOxygen } from "react-icons/si";
import { FaRunning } from "react-icons/fa";
import { GiBrokenShield } from "react-icons/gi";
import useData from "../../hooks/useData";
import { CircleBar } from "../CircleBar";
import { SquareBar } from "../SquareBar";
import { CircleBarChart } from "../CircleBarChart";
import { PiEngineFill } from "react-icons/pi";

export const StatusBars = () => {
  const { statusBars, vehicleHud } = useData();

  return (
    <>
      {statusBars.type == 1 && (
        <div className="flex gap-2.5">
          {/* voice ? */}
          <HexagonBar
            noAnim={true}
            color={
              (statusBars?.voice?.isTalking &&
                statusBars?.voice?.isTalkingColor) ||
              statusBars?.voice?.color
            }
            occupancy={
              statusBars.voice.range <= 3
                ? statusBars.voice.range * 30
                : 90 + (statusBars.voice.range - 3) * 10
            }
            hidden={!statusBars?.voice?.active}
          >
            <span>
              {!statusBars?.voice?.radio && (
                <FaHeadSideCough className={"text-white w-3.5 h-3.5"} />
              )}
              {statusBars?.voice?.radio && (
                <FaHeadphones className={"text-white w-3.5 h-3.5"} />
              )}
            </span>
            <div className="inherit"></div>
          </HexagonBar>
          {/* health */}
          <HexagonBar
            color={statusBars?.health?.color}
            occupancy={statusBars?.health?.progressLevel}
            hidden={
              !statusBars?.health?.active ||
              (statusBars?.health?.autoHide < 100 &&
                statusBars?.health?.progressLevel >
                  statusBars?.health?.autoHide)
            }
          >
            <span>
              <RiHeart3Fill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </HexagonBar>
          {/* armor */}
          <HexagonBar
            color={statusBars?.armor?.color}
            occupancy={statusBars?.armor?.progressLevel}
            hidden={
              !statusBars?.armor?.active ||
              (statusBars?.armor?.autoHide < 100 &&
                statusBars?.armor?.progressLevel > statusBars?.armor?.autoHide)
            }
          >
            <span>
              {statusBars?.armor?.progressLevel > 0 ? (
                <PiShieldFill className={"text-white w-3.5 h-3.5"} />
              ) : (
                <GiBrokenShield className={"text-white w-3.5 h-3.5"} />
              )}
            </span>
            <div className="inherit"></div>
          </HexagonBar>
          {/* hunger */}
          <HexagonBar
            color={statusBars?.hunger?.color}
            occupancy={statusBars?.hunger?.progressLevel}
            hidden={
              !statusBars?.hunger?.active ||
              (statusBars?.hunger.autoHide < 100 &&
                statusBars?.hunger?.progressLevel >
                  statusBars?.hunger?.autoHide)
            }
          >
            <span>
              <PiHamburgerFill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </HexagonBar>
          {/* thirst */}
          <HexagonBar
            color={statusBars?.thirst?.color}
            occupancy={statusBars?.thirst?.progressLevel}
            hidden={
              !statusBars?.thirst?.active ||
              (statusBars?.thirst?.autoHide < 100 &&
                statusBars?.thirst?.progressLevel >
                  statusBars?.thirst?.autoHide)
            }
          >
            <span>
              <IoMdWater className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </HexagonBar>
          {/* oxygen */}
          <HexagonBar
            color={statusBars?.oxygen?.color}
            occupancy={statusBars?.oxygen?.progressLevel}
            hidden={
              !statusBars?.oxygen?.active ||
              (statusBars?.oxygen?.autoHide < 100 &&
                statusBars?.oxygen?.progressLevel >
                  statusBars?.oxygen?.autoHide)
            }
          >
            <span>
              <SiOxygen className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </HexagonBar>
          {/* stamina */}
          <HexagonBar
            color={statusBars?.stamina?.color}
            occupancy={statusBars?.stamina?.progressLevel}
            hidden={
              !statusBars?.stamina?.active ||
              (statusBars?.stamina?.autoHide < 100 &&
                statusBars?.stamina?.progressLevel >
                  statusBars?.stamina?.autoHide)
            }
          >
            <span>
              <FaRunning className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </HexagonBar>
          {/* engine health */}
          <HexagonBar
            color={
              vehicleHud.engineHealth > 599
                ? "green"
                : vehicleHud.engineHealth > 0
                ? "orange"
                : "red"
            }
            occupancy={vehicleHud.engineHealth / 10}
            hidden={
              vehicleHud.hidden ||
              !vehicleHud.show ||
              !statusBars.engineHealth.active ||
              vehicleHud.engineHealth == 1000 ||
              (statusBars?.engineHealth?.autoHide < 100 &&
                vehicleHud.engineHealth / 10 >
                  statusBars?.engineHealth?.autoHide)
            }
          >
            <span>
              <PiEngineFill className="w-3.5 h-3.5 text-white" />
            </span>
            <div className="inherit"></div>
          </HexagonBar>
          {/* stress */}
          <HexagonBar
            color={statusBars?.stress?.color}
            occupancy={statusBars?.stress?.progressLevel}
            hidden={
              !statusBars?.stress?.active ||
              (statusBars?.stress?.autoHide < 100 &&
                statusBars?.stress?.progressLevel >
                  statusBars?.stress?.autoHide)
            }
          >
            <span>
              <RiBrainFill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </HexagonBar>
          {/* terminal */}
          <HexagonBar
            color={statusBars?.terminal?.color}
            occupancy={statusBars?.terminal?.progressLevel}
            hidden={!statusBars?.terminal?.active}
          >
            <span>
              <FaTerminal className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </HexagonBar>
          {/* leaf */}
          <HexagonBar
            color={statusBars?.leaf?.color}
            occupancy={statusBars?.leaf?.progressLevel}
            hidden={!statusBars?.leaf?.active}
          >
            <span>
              <FaLeaf className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </HexagonBar>
        </div>
      )}
      {statusBars.type == 2 && (
        <div className="flex gap-2.5 mt-2">
          {/* voice ? */}
          <CircleBar
            noAnim={true}
            color={
              (statusBars?.voice?.isTalking &&
                statusBars?.voice?.isTalkingColor) ||
              statusBars?.voice?.color
            }
            occupancy={
              statusBars.voice.range <= 3
                ? statusBars.voice.range * 30
                : 90 + (statusBars.voice.range - 3) * 10
            }
            hidden={!statusBars?.voice?.active}
          >
            {!statusBars?.voice?.radio ? (
              <FaHeadSideCough className="w-5 h-5" />
            ) : (
              <FaHeadphones className="w-5 h-5" />
            )}
          </CircleBar>
          {/* health */}
          <CircleBar
            color={statusBars?.health?.color}
            occupancy={statusBars?.health?.progressLevel}
            hidden={
              !statusBars?.health?.active ||
              (statusBars?.health?.autoHide < 100 &&
                statusBars?.health?.progressLevel >
                  statusBars?.health?.autoHide)
            }
          >
            <span>
              <RiHeart3Fill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBar>
          {/* armor */}
          <CircleBar
            color={statusBars?.armor?.color}
            occupancy={statusBars?.armor?.progressLevel}
            hidden={
              !statusBars?.armor?.active ||
              (statusBars?.armor?.autoHide < 100 &&
                statusBars?.armor?.progressLevel > statusBars?.armor?.autoHide)
            }
          >
            <span>
              {statusBars?.armor?.progressLevel > 0 ? (
                <PiShieldFill className={"text-white w-3.5 h-3.5"} />
              ) : (
                <GiBrokenShield className={"text-white w-3.5 h-3.5"} />
              )}
            </span>
            <div className="inherit"></div>
          </CircleBar>
          {/* hunger */}
          <CircleBar
            color={statusBars?.hunger?.color}
            occupancy={statusBars?.hunger?.progressLevel}
            hidden={
              !statusBars?.hunger?.active ||
              (statusBars?.hunger.autoHide < 100 &&
                statusBars?.hunger?.progressLevel >
                  statusBars?.hunger?.autoHide)
            }
          >
            <span>
              <PiHamburgerFill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBar>
          {/* thirst */}
          <CircleBar
            color={statusBars?.thirst?.color}
            occupancy={statusBars?.thirst?.progressLevel}
            hidden={
              !statusBars?.thirst?.active ||
              (statusBars?.thirst?.autoHide < 100 &&
                statusBars?.thirst?.progressLevel >
                  statusBars?.thirst?.autoHide)
            }
          >
            <span>
              <IoMdWater className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBar>
          {/* oxygen */}
          <CircleBar
            color={statusBars?.oxygen?.color}
            occupancy={statusBars?.oxygen?.progressLevel}
            hidden={
              !statusBars?.oxygen?.active ||
              (statusBars?.oxygen?.autoHide < 100 &&
                statusBars?.oxygen?.progressLevel >
                  statusBars?.oxygen?.autoHide)
            }
          >
            <span>
              <SiOxygen className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBar>
          {/* stamina */}
          <CircleBar
            color={statusBars?.stamina?.color}
            occupancy={statusBars?.stamina?.progressLevel}
            hidden={
              !statusBars?.stamina?.active ||
              (statusBars?.stamina?.autoHide < 100 &&
                statusBars?.stamina?.progressLevel >
                  statusBars?.stamina?.autoHide)
            }
          >
            <span>
              <FaRunning className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBar>
          {/* engine health */}
          <CircleBar
            color={
              vehicleHud.engineHealth > 599
                ? "green"
                : vehicleHud.engineHealth > 0
                ? "orange"
                : "red"
            }
            occupancy={vehicleHud.engineHealth / 10}
            hidden={
              vehicleHud.hidden ||
              !vehicleHud.show ||
              !statusBars.engineHealth.active ||
              vehicleHud.engineHealth == 1000 ||
              (statusBars?.engineHealth?.autoHide < 100 &&
                vehicleHud.engineHealth / 10 >
                  statusBars?.engineHealth?.autoHide)
            }
          >
            <span>
              <PiEngineFill className="w-3.5 h-3.5 text-white" />
            </span>
            <div className="inherit"></div>
          </CircleBar>
          {/* stress */}
          <CircleBar
            color={statusBars?.stress?.color}
            occupancy={statusBars?.stress?.progressLevel}
            hidden={
              !statusBars?.stress?.active ||
              (statusBars?.stress?.autoHide < 100 &&
                statusBars?.stress?.progressLevel >
                  statusBars?.stress?.autoHide)
            }
          >
            <span>
              <RiBrainFill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBar>
          {/* terminal */}
          <CircleBar
            color={statusBars?.terminal?.color}
            occupancy={statusBars?.terminal?.progressLevel}
            hidden={!statusBars?.terminal?.active}
          >
            <FaTerminal className={"w-5 h-5"} />
          </CircleBar>
          {/* leaf */}
          <CircleBar
            color={statusBars?.leaf?.color}
            occupancy={statusBars?.leaf?.progressLevel}
            hidden={!statusBars?.leaf?.active}
          >
            <FaLeaf className={"w-5 h-5"} />
          </CircleBar>
        </div>
      )}
      {statusBars.type == 3 && (
        <div className="flex gap-2.5 mt-2">
          {/* voice ? */}
          <SquareBar
            noAnim={true}
            color={
              (statusBars?.voice?.isTalking &&
                statusBars?.voice?.isTalkingColor) ||
              statusBars?.voice?.color
            }
            occupancy={
              statusBars.voice.range <= 3
                ? statusBars.voice.range * 30
                : 90 + (statusBars.voice.range - 3) * 10
            }
            hidden={!statusBars?.voice?.active}
            animDelay="100ms"
          >
            <span>
              {!statusBars?.voice?.radio && (
                <FaHeadSideCough className={"text-white w-3.5 h-3.5"} />
              )}
              {statusBars?.voice?.radio && (
                <FaHeadphones className={"text-white w-3.5 h-3.5"} />
              )}
            </span>
            <div className="inherit"></div>
          </SquareBar>
          {/* health */}
          <SquareBar
            color={statusBars?.health?.color}
            occupancy={statusBars?.health?.progressLevel}
            hidden={
              !statusBars?.health?.active ||
              (statusBars?.health?.autoHide < 100 &&
                statusBars?.health?.progressLevel >
                  statusBars?.health?.autoHide)
            }
          >
            <span>
              <RiHeart3Fill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </SquareBar>
          {/* armor */}
          <SquareBar
            color={statusBars?.armor?.color}
            occupancy={statusBars?.armor?.progressLevel}
            hidden={
              !statusBars?.armor?.active ||
              (statusBars?.armor?.autoHide < 100 &&
                statusBars?.armor?.progressLevel > statusBars?.armor?.autoHide)
            }
          >
            <span>
              {statusBars?.armor?.progressLevel > 0 ? (
                <PiShieldFill className={"text-white w-3.5 h-3.5"} />
              ) : (
                <GiBrokenShield className={"text-white w-3.5 h-3.5"} />
              )}
            </span>
            <div className="inherit"></div>
          </SquareBar>
          {/* hunger */}
          <SquareBar
            color={statusBars?.hunger?.color}
            occupancy={statusBars?.hunger?.progressLevel}
            hidden={
              !statusBars?.hunger?.active ||
              (statusBars?.hunger.autoHide < 100 &&
                statusBars?.hunger?.progressLevel >
                  statusBars?.hunger?.autoHide)
            }
          >
            <span>
              <PiHamburgerFill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </SquareBar>
          {/* thirst */}
          <SquareBar
            color={statusBars?.thirst?.color}
            occupancy={statusBars?.thirst?.progressLevel}
            hidden={
              !statusBars?.thirst?.active ||
              (statusBars?.thirst?.autoHide < 100 &&
                statusBars?.thirst?.progressLevel >
                  statusBars?.thirst?.autoHide)
            }
          >
            <span>
              <IoMdWater className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </SquareBar>
          {/* oxygen */}
          <SquareBar
            color={statusBars?.oxygen?.color}
            occupancy={statusBars?.oxygen?.progressLevel}
            hidden={
              !statusBars?.oxygen?.active ||
              (statusBars?.oxygen?.autoHide < 100 &&
                statusBars?.oxygen?.progressLevel >
                  statusBars?.oxygen?.autoHide)
            }
          >
            <span>
              <SiOxygen className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </SquareBar>
          {/* stamina */}
          <SquareBar
            color={statusBars?.stamina?.color}
            occupancy={statusBars?.stamina?.progressLevel}
            hidden={
              !statusBars?.stamina?.active ||
              (statusBars?.stamina?.autoHide < 100 &&
                statusBars?.stamina?.progressLevel >
                  statusBars?.stamina?.autoHide)
            }
          >
            <span>
              <FaRunning className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </SquareBar>
          {/* engine health */}
          <SquareBar
            color={
              vehicleHud.engineHealth > 599
                ? "green"
                : vehicleHud.engineHealth > 0
                ? "orange"
                : "red"
            }
            occupancy={vehicleHud.engineHealth / 10}
            hidden={
              vehicleHud.hidden ||
              !vehicleHud.show ||
              !statusBars.engineHealth.active ||
              vehicleHud.engineHealth == 1000 ||
              (statusBars?.engineHealth?.autoHide < 100 &&
                vehicleHud.engineHealth / 10 >
                  statusBars?.engineHealth?.autoHide)
            }
          >
            <span>
              <PiEngineFill className="w-3.5 h-3.5 text-white" />
            </span>
            <div className="inherit"></div>
          </SquareBar>
          {/* stress */}
          <SquareBar
            color={statusBars?.stress?.color}
            occupancy={statusBars?.stress?.progressLevel}
            hidden={
              !statusBars?.stress?.active ||
              (statusBars?.stress?.autoHide < 100 &&
                statusBars?.stress?.progressLevel >
                  statusBars?.stress?.autoHide)
            }
          >
            <span>
              <RiBrainFill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </SquareBar>
          {/* terminal */}
          <SquareBar
            color={statusBars?.terminal?.color}
            occupancy={statusBars?.terminal?.progressLevel}
            hidden={!statusBars?.terminal?.active}
            animDelay="500ms"
          >
            <span>
              <FaTerminal className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </SquareBar>
          {/* leaf */}
          <SquareBar
            color={statusBars?.leaf?.color}
            occupancy={statusBars?.leaf?.progressLevel}
            hidden={!statusBars?.leaf?.active}
            animDelay="550ms"
          >
            <span>
              <FaLeaf className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </SquareBar>
        </div>
      )}
      {statusBars.type == 4 && (
        <div className="flex gap-2.5 mt-2">
          {/* voice ? */}
          <CircleBarChart
            noAnim={true}
            color={
              (statusBars?.voice?.isTalking &&
                statusBars?.voice?.isTalkingColor) ||
              statusBars?.voice?.color
            }
            occupancy={
              statusBars.voice.range <= 3
                ? statusBars.voice.range * 30
                : 90 + (statusBars.voice.range - 3) * 10
            }
            hidden={!statusBars?.voice?.active}
          >
            {!statusBars?.voice?.radio ? (
              <FaHeadSideCough className="w-5 h-5" />
            ) : (
              <FaHeadphones className="w-5 h-5" />
            )}
          </CircleBarChart>
          {/* health */}
          <CircleBarChart
            color={statusBars?.health?.color}
            occupancy={statusBars?.health?.progressLevel}
            hidden={
              !statusBars?.health?.active ||
              (statusBars?.health?.autoHide < 100 &&
                statusBars?.health?.progressLevel >
                  statusBars?.health?.autoHide)
            }
          >
            <span>
              <RiHeart3Fill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBarChart>
          {/* armor */}
          <CircleBarChart
            color={statusBars?.armor?.color}
            occupancy={statusBars?.armor?.progressLevel}
            hidden={
              !statusBars?.armor?.active ||
              (statusBars?.armor?.autoHide < 100 &&
                statusBars?.armor?.progressLevel > statusBars?.armor?.autoHide)
            }
          >
            <span>
              {statusBars?.armor?.progressLevel > 0 ? (
                <PiShieldFill className={"text-white w-3.5 h-3.5"} />
              ) : (
                <GiBrokenShield className={"text-white w-3.5 h-3.5"} />
              )}
            </span>
            <div className="inherit"></div>
          </CircleBarChart>
          {/* hunger */}
          <CircleBarChart
            color={statusBars?.hunger?.color}
            occupancy={statusBars?.hunger?.progressLevel}
            hidden={
              !statusBars?.hunger?.active ||
              (statusBars?.hunger.autoHide < 100 &&
                statusBars?.hunger?.progressLevel >
                  statusBars?.hunger?.autoHide)
            }
          >
            <span>
              <PiHamburgerFill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBarChart>
          {/* thirst */}
          <CircleBarChart
            color={statusBars?.thirst?.color}
            occupancy={statusBars?.thirst?.progressLevel}
            hidden={
              !statusBars?.thirst?.active ||
              (statusBars?.thirst?.autoHide < 100 &&
                statusBars?.thirst?.progressLevel >
                  statusBars?.thirst?.autoHide)
            }
          >
            <span>
              <IoMdWater className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBarChart>
          {/* oxygen */}
          <CircleBarChart
            color={statusBars?.oxygen?.color}
            occupancy={statusBars?.oxygen?.progressLevel}
            hidden={
              !statusBars?.oxygen?.active ||
              (statusBars?.oxygen?.autoHide < 100 &&
                statusBars?.oxygen?.progressLevel >
                  statusBars?.oxygen?.autoHide)
            }
          >
            <span>
              <SiOxygen className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBarChart>
          {/* stamina */}
          <CircleBarChart
            color={statusBars?.stamina?.color}
            occupancy={statusBars?.stamina?.progressLevel}
            hidden={
              !statusBars?.stamina?.active ||
              (statusBars?.stamina?.autoHide < 100 &&
                statusBars?.stamina?.progressLevel >
                  statusBars?.stamina?.autoHide)
            }
          >
            <span>
              <FaRunning className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBarChart>
          {/* engine health */}
          <CircleBarChart
            color={
              vehicleHud.engineHealth > 599
                ? "green"
                : vehicleHud.engineHealth > 0
                ? "orange"
                : "red"
            }
            occupancy={vehicleHud.engineHealth / 10}
            hidden={
              vehicleHud.hidden ||
              !vehicleHud.show ||
              !statusBars.engineHealth.active ||
              vehicleHud.engineHealth == 1000 ||
              (statusBars?.engineHealth?.autoHide < 100 &&
                vehicleHud.engineHealth / 10 >
                  statusBars?.engineHealth?.autoHide)
            }
          >
            <span>
              <PiEngineFill className="w-3.5 h-3.5 text-white" />
            </span>
            <div className="inherit"></div>
          </CircleBarChart>
          {/* stress */}
          <CircleBarChart
            color={statusBars?.stress?.color}
            occupancy={statusBars?.stress?.progressLevel}
            hidden={
              !statusBars?.stress?.active ||
              (statusBars?.stress?.autoHide < 100 &&
                statusBars?.stress?.progressLevel >
                  statusBars?.stress?.autoHide)
            }
          >
            <span>
              <RiBrainFill className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBarChart>
          {/* terminal */}
          <CircleBarChart
            color={statusBars?.terminal?.color}
            occupancy={statusBars?.terminal?.progressLevel}
            hidden={!statusBars?.terminal?.active}
            animDelay="500ms"
          >
            <span>
              <FaTerminal className={"text-white w-3.5 h-3.5"} />
            </span>
            <div className="inherit"></div>
          </CircleBarChart>
          {/* terminal */}
          <CircleBarChart
            color={statusBars?.terminal?.color}
            occupancy={statusBars?.terminal?.progressLevel}
            hidden={!statusBars?.terminal?.active}
          >
            <FaTerminal className={"w-5 h-5"} />
          </CircleBarChart>
          {/* leaf */}
          <CircleBarChart
            color={statusBars?.leaf?.color}
            occupancy={statusBars?.leaf?.progressLevel}
            hidden={!statusBars?.leaf?.active}
          >
            <FaLeaf className={"w-5 h-5"} />
          </CircleBarChart>
        </div>
      )}
    </>
  );
};
