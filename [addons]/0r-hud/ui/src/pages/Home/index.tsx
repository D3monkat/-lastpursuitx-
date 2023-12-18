import { StatusBars } from "../../components/StatusBars";
import { VehicleHud } from "../../components/VehicleHud";

const Home = () => {
  return (
    <div>
      {/* Start Status Bars */}
      <div className="absolute bottom-2 left-6">
        <StatusBars />
      </div>
      {/* End Status Bars */}
      {/* Start Car Hud */}
      <div className="absolute bottom-16 left-[22rem]">
        <VehicleHud />
      </div>
      {/* End Car Hud */}
    </div>
  );
};
export default Home;
