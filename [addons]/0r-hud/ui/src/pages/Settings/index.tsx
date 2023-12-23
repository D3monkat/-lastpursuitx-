import { FaGear } from "react-icons/fa6";
import { TbTableFilled } from "react-icons/tb";
import { IoHelp } from "react-icons/io5";
import { TbSettingsPause } from "react-icons/tb";
import { FaMapLocationDot } from "react-icons/fa6";
import classNames from "classnames";
import { useEffect, useState } from "react";
import { SettingsPagesProps } from "../../types/BasicTypes";
import { HudSettings } from "./HudSettings";
import useData from "../../hooks/useData";
import "./index.sass";
import Home from "../Home";
import { fetchNui } from "../../utils/fetchNui";
import useLocales from "../../hooks/useLocales";
import { HelpGuides } from "./HelpGuides";

const Settings = () => {
  const { saveSettings } = useData();
  const { locale } = useLocales();

  const [activePage, setActivePage] = useState<SettingsPagesProps>("hud");

  const handleSaveSettings = () => {
    saveSettings(activePage);
  };

  useEffect(() => {
    if (activePage == "map") {
      const event = new KeyboardEvent("keydown", {
        key: "Escape",
        code: "Escape",
      });
      window.dispatchEvent(event);
      fetchNui("openBigMap");
    } else if (activePage == "pause_menu") {
      const event = new KeyboardEvent("keydown", {
        key: "Escape",
        code: "Escape",
      });
      window.dispatchEvent(event);
      fetchNui("openPauseMenu");
    }
  }, [activePage]);

  return (
    <>
      <div className="h-full w-full flex items-center justify-center">
        <div className="relative flex w-[50rem] h-[51rem] flex-col rounded-2xl bg-gradient-to-b from-settings/70 to-[#22283b]">
          <div>
            <div className="p-4 text-start flex items-center gap-2">
              <div className="relative">
                <FaGear className="w-6 h-6 text-settings_green" />
                <div className="absolute shadow-settings_green shadow-[0_0_24px_8px] left-3 bottom-3"></div>
              </div>
              <div>
                <h1 className="font-bold text-xl font-[inherit] text-settings_green text-shadow shadow-settings_green">
                  {locale.settings_text_settings_menu}
                </h1>
                <h1 className="text-sm font-[inherit] text-gray-400">
                  {locale.settings_text_change_your_settings}
                </h1>
              </div>
              <div className="ml-auto">
                <button
                  className="bg-[#003c3f] p-1.5 px-8 brightness-110 hover:brightness-125 rounded-sm"
                  onClick={handleSaveSettings}
                >
                  <h1 className="text-sm text-settings_green">
                    {locale.settings_text_save}
                  </h1>
                </button>
              </div>
            </div>
            <hr className="border-white/10 mb-2" />
            <div className="py-4 px-8 h-full">
              <div className="flex gap-6 h-full">
                <div>
                  <div className="flex flex-col gap-2.5">
                    <button
                      onClick={() => setActivePage("hud")}
                      className={classNames(
                        "bg-gray-700 w-36 h-40 bg-opacity-80 transition-all group hover:bg-[#003c3f]",
                        {
                          "!bg-[#003c3f]": activePage == "hud",
                        }
                      )}
                    >
                      <div className="flex flex-col w-full h-full">
                        <div className="mt-6 mx-auto relative">
                          <TbTableFilled
                            className={classNames(
                              "w-16 h-16 text-settings_gray group-hover:text-settings_green",
                              {
                                "!text-settings_green": activePage == "hud",
                              }
                            )}
                          />
                          <div
                            className={classNames(
                              "absolute left-8 bottom-7 group-hover:shadow-settings_green group-hover:shadow-[0_0_48px_14px]",
                              {
                                "shadow-settings_green shadow-[0_0_48px_14px]":
                                  activePage == "hud",
                              },
                              {
                                "shadow-settings_gray shadow-[0_0_48px_14px]":
                                  activePage != "hud",
                              }
                            )}
                          ></div>
                        </div>
                        <div className="mt-auto m-3 mx-4 font-[inherit]">
                          <div>
                            <h1
                              className={classNames(
                                "font-bold text-settings_gray group-hover:text-settings_green",
                                {
                                  "!text-settings_green": activePage == "hud",
                                }
                              )}
                            >
                              {locale.settings_text_hud}
                            </h1>
                            <h1 className="text-xs font-medium text-white/40 -mt-1">
                              {locale.settings_text_settings}
                            </h1>
                          </div>
                        </div>
                        <div
                          className={classNames(
                            "w-full h-1 group-hover:bg-settings_green group-hover:shadow-settings_green group-hover:shadow-[0_0_8px_0px]",
                            {
                              "bg-settings_green shadow-settings_green shadow-[0_0_8px_0px]":
                                activePage == "hud",
                            },
                            {
                              "bg-white/30 shadow-white/30 shadow-[0_0_8px_0px]":
                                activePage != "hud",
                            }
                          )}
                        />
                      </div>
                    </button>
                    <button
                      onClick={() => setActivePage("help_guides")}
                      className={classNames(
                        "bg-gray-700 w-36 h-40 bg-opacity-80 transition-all group hover:bg-[#003c3f]",
                        {
                          "!bg-[#003c3f]": activePage == "help_guides",
                        }
                      )}
                    >
                      <div className="flex flex-col w-full h-full">
                        <div className="mt-6 mx-auto relative">
                          <IoHelp
                            className={classNames(
                              "w-14 h-14 text-settings_gray bg-settings_gray/40 rounded-3xl group-hover:text-settings_green gorup-hover:bg-settings_green/20",
                              {
                                "!text-settings_green !bg-settings_green/20":
                                  activePage == "help_guides",
                              }
                            )}
                          />
                        </div>
                        <div className="mt-auto m-3 mx-4 font-[inherit]">
                          <div>
                            <h1
                              className={classNames(
                                "font-bold text-settings_gray group-hover:text-settings_green",
                                {
                                  "!text-settings_green":
                                    activePage == "help_guides",
                                }
                              )}
                            >
                              {locale.settings_text_help_guides}
                            </h1>
                            <h1 className="text-xs font-medium text-white/40 -mt-1">
                              {locale.settings_text_settings}
                            </h1>
                          </div>
                        </div>
                        <div
                          className={classNames(
                            "w-full h-1 group-hover:bg-settings_green group-hover:shadow-settings_green group-hover:shadow-[0_0_8px_0px]",
                            {
                              "bg-settings_green shadow-settings_green shadow-[0_0_8px_0px]":
                                activePage == "help_guides",
                            },
                            {
                              "bg-white/30 shadow-white/30 shadow-[0_0_8px_0px]":
                                activePage != "help_guides",
                            }
                          )}
                        />
                      </div>
                    </button>
                    <button
                      onClick={() => setActivePage("map")}
                      className={classNames(
                        "bg-gray-700 w-36 h-40 bg-opacity-80 transition-all group hover:bg-[#003c3f]",
                        {
                          "!bg-[#003c3f]": activePage == "map",
                        }
                      )}
                    >
                      <div className="flex flex-col w-full h-full">
                        <div className="mt-6 mx-auto relative">
                          <FaMapLocationDot
                            className={classNames(
                              "w-16 h-16 text-settings_gray group-hover:text-settings_green",
                              {
                                "!text-settings_green": activePage == "map",
                              }
                            )}
                          />
                          <div
                            className={classNames(
                              "absolute left-8 bottom-7 group-hover:shadow-settings_green group-hover:shadow-[0_0_48px_14px]",
                              {
                                "shadow-settings_green shadow-[0_0_48px_14px]":
                                  activePage == "map",
                              },
                              {
                                "shadow-settings_gray shadow-[0_0_48px_14px]":
                                  activePage != "map",
                              }
                            )}
                          ></div>
                        </div>
                        <div className="mt-auto m-3 mx-4 font-[inherit]">
                          <div>
                            <h1
                              className={classNames(
                                "font-bold text-settings_gray group-hover:text-settings_green",
                                {
                                  "!text-settings_green": activePage == "map",
                                }
                              )}
                            >
                              {locale.settings_text_map}
                            </h1>
                            <h1 className="text-xs font-medium text-white/40 -mt-1">
                              {locale.settings_text_open_map}
                            </h1>
                          </div>
                        </div>
                        <div
                          className={classNames(
                            "w-full h-1 group-hover:bg-settings_green group-hover:shadow-settings_green group-hover:shadow-[0_0_8px_0px]",
                            {
                              "bg-settings_green shadow-settings_green shadow-[0_0_8px_0px]":
                                activePage == "map",
                            },
                            {
                              "bg-white/30 shadow-white/30 shadow-[0_0_8px_0px]":
                                activePage != "map",
                            }
                          )}
                        />
                      </div>
                    </button>
                    <button
                      onClick={() => setActivePage("pause_menu")}
                      className={classNames(
                        "bg-gray-700 w-36 h-40 bg-opacity-80 transition-all group hover:bg-[#003c3f]",
                        {
                          "!bg-[#003c3f]": activePage == "pause_menu",
                        }
                      )}
                    >
                      <div className="flex flex-col w-full h-full">
                        <div className="mt-6 mx-auto relative">
                          <TbSettingsPause
                            className={classNames(
                              "w-16 h-16 text-settings_gray group-hover:text-settings_green",
                              {
                                "!text-settings_green":
                                  activePage == "pause_menu",
                              }
                            )}
                          />
                          <div
                            className={classNames(
                              "absolute left-8 bottom-7 group-hover:shadow-settings_green group-hover:shadow-[0_0_48px_14px]",
                              {
                                "shadow-settings_green shadow-[0_0_48px_14px]":
                                  activePage == "pause_menu",
                              },
                              {
                                "shadow-settings_gray shadow-[0_0_48px_14px]":
                                  activePage != "pause_menu",
                              }
                            )}
                          ></div>
                        </div>
                        <div className="mt-auto m-3 mx-4 font-[inherit]">
                          <div>
                            <h1
                              className={classNames(
                                "font-bold text-settings_gray group-hover:text-settings_green",
                                {
                                  "!text-settings_green":
                                    activePage == "pause_menu",
                                }
                              )}
                            >
                              {locale.settings_text_settings}
                            </h1>
                            <h1 className="text-xs font-medium text-white/40 -mt-1">
                              {locale.settings_text_open_settings_menu}
                            </h1>
                          </div>
                        </div>
                        <div
                          className={classNames(
                            "w-full h-1 group-hover:bg-settings_green group-hover:shadow-settings_green group-hover:shadow-[0_0_8px_0px]",
                            {
                              "bg-settings_green shadow-settings_green shadow-[0_0_8px_0px]":
                                activePage == "pause_menu",
                            },
                            {
                              "bg-white/30 shadow-white/30 shadow-[0_0_8px_0px]":
                                activePage != "pause_menu",
                            }
                          )}
                        />
                      </div>
                    </button>
                  </div>
                </div>
                <div className="w-full overflow-auto h-[42.5rem] no-scrollbar">
                  {/* Menü itemleri */}
                  {activePage == "hud" && <HudSettings />}
                  {activePage == "help_guides" && <HelpGuides />}
                  {/* @ */}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <Home />
    </>
  );
};

export default Settings;
