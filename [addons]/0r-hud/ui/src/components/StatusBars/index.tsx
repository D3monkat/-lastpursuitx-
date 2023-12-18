import { FaHeadSideCough } from "react-icons/fa";
import { RiHeart3Fill } from "react-icons/ri";
import { PiShieldFill } from "react-icons/pi";
import { PiHamburgerFill } from "react-icons/pi";
import { IoMdWater } from "react-icons/io";
import { RiBrainFill } from "react-icons/ri";
import { FaTerminal } from "react-icons/fa";
import { FaLeaf } from "react-icons/fa";
import { IoRadio } from "react-icons/io5";
import { HexagonBar } from "../HexagonBar";
import { SiOxygen } from "react-icons/si";
import { FaRunning } from "react-icons/fa";
import useData from "../../hooks/useData";

export const StatusBars = () => {
  const { statusBars } = useData();

  return (
    <div className="flex gap-2.5">
      {/* voice ? */}
      <HexagonBar
        noAnim={true}
        color={
          (statusBars?.voice?.isTalking && statusBars?.voice?.isTalkingColor) ||
          statusBars?.voice?.color
        }
        occupancy={80}
        hidden={!statusBars?.voice?.active}
      >
        <span>
          {!statusBars?.voice?.radio && (
            <FaHeadSideCough className={"text-white w-3.5 h-3.5"} />
          )}
          {statusBars?.voice?.radio && (
            <IoRadio className={"text-white w-3.5 h-3.5"} />
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
          statusBars?.health?.progressLevel > statusBars?.health?.autoHide
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
          statusBars?.armor?.progressLevel > statusBars?.armor?.autoHide
        }
      >
        <span>
          <PiShieldFill className={"text-white w-3.5 h-3.5"} />
        </span>
        <div className="inherit"></div>
      </HexagonBar>
      {/* hunger */}
      <HexagonBar
        color={statusBars?.hunger?.color}
        occupancy={statusBars?.hunger?.progressLevel}
        hidden={
          !statusBars?.hunger?.active ||
          statusBars?.hunger?.progressLevel > statusBars?.hunger?.autoHide
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
          statusBars?.thirst?.progressLevel > statusBars?.thirst?.autoHide
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
          statusBars?.oxygen?.progressLevel > statusBars?.oxygen?.autoHide
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
          statusBars?.stamina?.progressLevel > statusBars?.stamina?.autoHide
        }
      >
        <span>
          <FaRunning className={"text-white w-3.5 h-3.5"} />
        </span>
        <div className="inherit"></div>
      </HexagonBar>
      {/* stress */}
      <HexagonBar
        color={statusBars?.stress?.color}
        occupancy={statusBars?.stress?.progressLevel}
        hidden={
          !statusBars?.stress?.active ||
          statusBars?.stress?.progressLevel > statusBars?.stress?.autoHide
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
  );
};
