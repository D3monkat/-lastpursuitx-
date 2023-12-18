import useData from "../../../hooks/useData";
import useLocales from "../../../hooks/useLocales";

export const HudSettings = () => {
  const { statusBars, vehicleHud, setVehicleHud, setStatusBars } = useData();
  const { locale } = useLocales();

  return (
    <div>
      <div className="mb-2 w-full">
        <div className="flex justify-between items-center gap-24 bg-[#393e50] p-2 px-4 text-start rounded">
          <div>
            <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
              {locale.settings_text_minimap_style}
            </h1>
            <h1 className="text-sm font-mono text-gray-400">
              {locale.settings_text_choose_minimap_style}
            </h1>
          </div>
          <div>
            <label htmlFor="minimapstyle" className="sr-only">
              {locale.settings_text_minimap_style}
            </label>
            <select
              id="minimapstyle"
              className="bg-[#005e5d] text-white text-sm p-2 px-3 ring-0 outline-none"
              value={vehicleHud.miniMaP.style}
              onChange={(event) => {
                setVehicleHud((p) => ({
                  ...p,
                  miniMaP: {
                    ...p.miniMaP,
                    style: event.target.value as any,
                  },
                }));
              }}
            >
              <option selected>
                {locale.settings_text_choose_minimap_style}
              </option>
              <option value="square">
                {locale.settings_text_minimap_square}
              </option>
              <option value="circle">
                {locale.settings_text_minimap_circle}
              </option>
            </select>
          </div>
        </div>
      </div>
      <div className="mb-2 w-full">
        <div className="flex justify-between items-center gap-24 bg-[#393e50] p-2 px-4 text-start rounded">
          <div>
            <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
              {locale.settings_text_speedometerFPS}
            </h1>
            <h1 className="text-sm font-mono text-gray-400">
              {locale.settings_text_speedometer_desc}
            </h1>
          </div>
          <div>
            <label htmlFor="speedometerfps" className="sr-only">
              {locale.settings_text_speedometerFPS}
            </label>
            <select
              id="speedometerfps"
              className="bg-[#005e5d] text-white text-sm p-2 px-3 ring-0 outline-none"
              value={vehicleHud.speedoMeter.fps}
              onChange={(event) => {
                setVehicleHud((p) => ({
                  ...p,
                  speedoMeter: {
                    fps: parseInt(event.target.value),
                  },
                }));
              }}
            >
              <option value="" disabled>
                {locale.settings_text_speedometerFPS}
              </option>
              <option value={15}>15</option>
              <option value={30}>30</option>
              <option value={60}>60</option>
            </select>
          </div>
        </div>
      </div>
      <div className="mb-2 w-full">
        <div className="flex justify-between items-center gap-24 bg-[#393e50] p-2 px-4 text-start rounded">
          <div>
            <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
              {locale.settings_text_health_icon}
            </h1>
            <h1 className="text-sm font-mono text-gray-400">
              {locale.settings_text_hideWhenMoreThen}
            </h1>
          </div>
          <div className="flex gap-2 items-center">
            <div>
              <label htmlFor="healthiconI" className="sr-only">
                HealthIcon
              </label>
              <div>
                <div className="p-1 px-4 bg-[#005e5d] flex items-center justify-between gap-2">
                  <div>
                    <h1 className="text-white text-xs">
                      {locale.settings_text_never_hide}
                    </h1>
                  </div>
                  <div>
                    <input
                      id="healthiconI"
                      className="w-14 py-0.5 text-xs text-center text-white bg-settings_green/20 border border-settings_green ring-0 outline-none"
                      value={statusBars?.health?.autoHide}
                      onChange={(event) => {
                        setStatusBars((p) => ({
                          ...p,
                          health: {
                            ...p.health,
                            autoHide: parseInt(event.target.value) as number,
                          },
                        }));
                      }}
                      max={100}
                      min={1}
                      type="number"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div>
              <label className="setting-switch">
                <input
                  type="checkbox"
                  checked={statusBars.health.active}
                  onChange={() => {
                    setStatusBars((p) => ({
                      ...p,
                      health: {
                        ...p.health,
                        active: !p.health.active,
                      },
                    }));
                  }}
                />
              </label>
            </div>
          </div>
        </div>
      </div>
      <div className="mb-2 w-full">
        <div className="flex justify-between items-center gap-24 bg-[#393e50] p-2 px-4 text-start rounded">
          <div>
            <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
              {locale.settings_text_armor_icon}
            </h1>
            <h1 className="text-sm font-mono text-gray-400">
              {locale.settings_text_hideWhenMoreThen}
            </h1>
          </div>
          <div className="flex gap-2 items-center">
            <div>
              <label htmlFor="armorIconI" className="sr-only">
                ArmorIcon
              </label>
              <div>
                <div className="p-1 px-4 bg-[#005e5d] flex items-center justify-between gap-2">
                  <div>
                    <h1 className="text-white text-xs">
                      {locale.settings_text_never_hide}
                    </h1>
                  </div>
                  <div>
                    <input
                      id="armorIconI"
                      className="w-14 py-0.5 text-xs text-center text-white bg-settings_green/20 border border-settings_green ring-0 outline-none"
                      value={statusBars.armor.autoHide}
                      onChange={(event) => {
                        setStatusBars((p) => ({
                          ...p,
                          armor: {
                            ...p.armor,
                            autoHide: parseInt(event.target.value) as number,
                          },
                        }));
                      }}
                      max={100}
                      min={1}
                      type="number"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div>
              <label className="setting-switch">
                <input
                  type="checkbox"
                  checked={statusBars.armor.active}
                  onChange={() => {
                    setStatusBars((p) => ({
                      ...p,
                      armor: {
                        ...p.armor,
                        active: !p.armor.active,
                      },
                    }));
                  }}
                />
              </label>
            </div>
          </div>
        </div>
      </div>
      <div className="mb-2 w-full">
        <div className="flex justify-between items-center gap-24 bg-[#393e50] p-2 px-4 text-start rounded">
          <div>
            <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
              {locale.settings_text_food_icon}
            </h1>
            <h1 className="text-sm font-mono text-gray-400">
              {locale.settings_text_hideWhenMoreThen}
            </h1>
          </div>
          <div className="flex gap-2 items-center">
            <div>
              <label htmlFor="foodiconI" className="sr-only">
                FoodIcon
              </label>
              <div>
                <div className="p-1 px-4 bg-[#005e5d] flex items-center justify-between gap-2">
                  <div>
                    <h1 className="text-white text-xs">
                      {locale.settings_text_never_hide}
                    </h1>
                  </div>
                  <div>
                    <input
                      id="foodiconI"
                      className="w-14 py-0.5 text-xs text-center text-white bg-settings_green/20 border border-settings_green ring-0 outline-none"
                      value={statusBars.hunger.autoHide}
                      onChange={(event) => {
                        setStatusBars((p) => ({
                          ...p,
                          hunger: {
                            ...p.hunger,
                            autoHide: parseInt(event.target.value) as number,
                          },
                        }));
                      }}
                      max={100}
                      min={1}
                      type="number"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div>
              <label className="setting-switch">
                <input
                  type="checkbox"
                  checked={statusBars.hunger.active}
                  onChange={() => {
                    setStatusBars((p) => ({
                      ...p,
                      hunger: {
                        ...p.hunger,
                        active: !p.hunger.active,
                      },
                    }));
                  }}
                />
              </label>
            </div>
          </div>
        </div>
      </div>
      <div className="mb-2 w-full">
        <div className="flex justify-between items-center gap-24 bg-[#393e50] p-2 px-4 text-start rounded">
          <div>
            <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
              {locale.settings_text_water_icon}
            </h1>
            <h1 className="text-sm font-mono text-gray-400">
              {locale.settings_text_hideWhenMoreThen}
            </h1>
          </div>
          <div className="flex gap-2 items-center">
            <div>
              <label htmlFor="watericonI" className="sr-only">
                WaterIcon
              </label>
              <div>
                <div className="p-1 px-4 bg-[#005e5d] flex items-center justify-between gap-2">
                  <div>
                    <h1 className="text-white text-xs">
                      {locale.settings_text_never_hide}
                    </h1>
                  </div>
                  <div>
                    <input
                      id="watericonI"
                      className="w-14 py-0.5 text-xs text-center text-white bg-settings_green/20 border border-settings_green ring-0 outline-none"
                      value={statusBars.thirst.autoHide}
                      onChange={(event) => {
                        setStatusBars((p) => ({
                          ...p,
                          thirst: {
                            ...p.thirst,
                            autoHide: parseInt(event.target.value) as number,
                          },
                        }));
                      }}
                      max={100}
                      min={1}
                      type="number"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div>
              <label className="setting-switch">
                <input
                  type="checkbox"
                  checked={statusBars.thirst.active}
                  onChange={() => {
                    setStatusBars((p) => ({
                      ...p,
                      thirst: {
                        ...p.thirst,
                        active: !p.thirst.active,
                      },
                    }));
                  }}
                />
              </label>
            </div>
          </div>
        </div>
      </div>
      <div className="mb-2 w-full">
        <div className="flex justify-between items-center gap-24 bg-[#393e50] p-2 px-4 text-start rounded">
          <div>
            <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
              {locale.settings_text_oxygen_icon}
            </h1>
            <h1 className="text-sm font-mono text-gray-400">
              {locale.settings_text_hideWhenMoreThen}
            </h1>
          </div>
          <div className="flex gap-2 items-center">
            <div>
              <label htmlFor="oxygeniconI" className="sr-only">
                oxygenIcon
              </label>
              <div>
                <div className="p-1 px-4 bg-[#005e5d] flex items-center justify-between gap-2">
                  <div>
                    <h1 className="text-white text-xs">
                      {locale.settings_text_never_hide}
                    </h1>
                  </div>
                  <div>
                    <input
                      id="oxygeniconI"
                      className="w-14 py-0.5 text-xs text-center text-white bg-settings_green/20 border border-settings_green ring-0 outline-none"
                      value={statusBars.oxygen.autoHide}
                      onChange={(event) => {
                        setStatusBars((p) => ({
                          ...p,
                          oxygen: {
                            ...p.oxygen,
                            autoHide: parseInt(event.target.value) as number,
                          },
                        }));
                      }}
                      max={100}
                      min={1}
                      type="number"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div>
              <label className="setting-switch">
                <input
                  type="checkbox"
                  checked={statusBars.oxygen.active}
                  onChange={() => {
                    setStatusBars((p) => ({
                      ...p,
                      oxygen: {
                        ...p.oxygen,
                        active: !p.oxygen.active,
                      },
                    }));
                  }}
                />
              </label>
            </div>
          </div>
        </div>
      </div>
      <div className="mb-2 w-full">
        <div className="flex justify-between items-center gap-24 bg-[#393e50] p-2 px-4 text-start rounded">
          <div>
            <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
              {locale.settings_text_stamina_icon}
            </h1>
            <h1 className="text-sm font-mono text-gray-400">
              {locale.settings_text_hideWhenMoreThen}
            </h1>
          </div>
          <div className="flex gap-2 items-center">
            <div>
              <label htmlFor="staminaiconI" className="sr-only">
                staminaIcon
              </label>
              <div>
                <div className="p-1 px-4 bg-[#005e5d] flex items-center justify-between gap-2">
                  <div>
                    <h1 className="text-white text-xs">
                      {locale.settings_text_never_hide}
                    </h1>
                  </div>
                  <div>
                    <input
                      id="staminaiconI"
                      className="w-14 py-0.5 text-xs text-center text-white bg-settings_green/20 border border-settings_green ring-0 outline-none"
                      value={statusBars.stamina.autoHide}
                      onChange={(event) => {
                        setStatusBars((p) => ({
                          ...p,
                          stamina: {
                            ...p.stamina,
                            autoHide: parseInt(event.target.value) as number,
                          },
                        }));
                      }}
                      max={100}
                      min={1}
                      type="number"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div>
              <label className="setting-switch">
                <input
                  type="checkbox"
                  checked={statusBars.stamina.active}
                  onChange={() => {
                    setStatusBars((p) => ({
                      ...p,
                      stamina: {
                        ...p.stamina,
                        active: !p.stamina.active,
                      },
                    }));
                  }}
                />
              </label>
            </div>
          </div>
        </div>
      </div>
      <div className="mb-2 w-full">
        <div className="flex justify-between items-center gap-24 bg-[#393e50] p-2 px-4 text-start rounded">
          <div>
            <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
              {locale.settings_text_stress_icon}
            </h1>
            <h1 className="text-sm font-mono text-gray-400">
              {locale.settings_text_hideWhenMoreThen}
            </h1>
          </div>
          <div className="flex gap-2 items-center">
            <div>
              <label htmlFor="stressiconI" className="sr-only">
                stressIcon
              </label>
              <div>
                <div className="p-1 px-4 bg-[#005e5d] flex items-center justify-between gap-2">
                  <div>
                    <h1 className="text-white text-xs">
                      {locale.settings_text_never_hide}
                    </h1>
                  </div>
                  <div>
                    <input
                      id="stressiconI"
                      className="w-14 py-0.5 text-xs text-center text-white bg-settings_green/20 border border-settings_green ring-0 outline-none"
                      value={statusBars.stress.autoHide}
                      onChange={(event) => {
                        setStatusBars((p) => ({
                          ...p,
                          stress: {
                            ...p.stress,
                            autoHide: parseInt(event.target.value) as number,
                          },
                        }));
                      }}
                      max={100}
                      min={1}
                      type="number"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div>
              <label className="setting-switch">
                <input
                  type="checkbox"
                  checked={statusBars.stress.active}
                  onChange={() => {
                    setStatusBars((p) => ({
                      ...p,
                      stress: {
                        ...p.stress,
                        active: !p.stress.active,
                      },
                    }));
                  }}
                />
              </label>
            </div>
          </div>
        </div>
      </div>
      <div className="mb-2 w-full">
        <div className="flex justify-between items-center gap-24 bg-[#393e50] p-2 px-4 text-start rounded">
          <div>
            <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
              {locale.settings_text_terminal_icon}
            </h1>
            <h1 className="text-sm font-mono text-gray-400">Hide / Show</h1>
          </div>
          <div className="flex gap-2 items-center">
            <div>
              <label className="setting-switch">
                <input
                  type="checkbox"
                  checked={statusBars.terminal.active}
                  onChange={() => {
                    setStatusBars((p) => ({
                      ...p,
                      terminal: {
                        ...p.terminal,
                        active: !p.terminal.active,
                      },
                    }));
                  }}
                />
              </label>
            </div>
          </div>
        </div>
      </div>
      <div className="mb-2 w-full">
        <div className="flex justify-between items-center gap-24 bg-[#393e50] p-2 px-4 text-start rounded">
          <div>
            <h1 className="font-semibold text-base text-settings_green text-shadow-sm shadow-settings_green">
              {locale.settings_text_leaf_icon}
            </h1>
            <h1 className="text-sm font-mono text-gray-400">Hide / Show</h1>
          </div>
          <div className="flex gap-2 items-center">
            <div>
              <label className="setting-switch">
                <input
                  type="checkbox"
                  checked={statusBars.leaf.active}
                  onChange={() => {
                    setStatusBars((p) => ({
                      ...p,
                      leaf: {
                        ...p.leaf,
                        active: !p.leaf.active,
                      },
                    }));
                  }}
                />
              </label>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
