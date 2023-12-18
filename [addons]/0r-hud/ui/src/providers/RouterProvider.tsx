import React, { createContext, useEffect, useMemo, useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { PageTypes, RouterProviderProps } from "../types/RouterProviderTypes";
import Home from "../pages/Home";
import Settings from "../pages/Settings";
import { debugData } from "../utils/debugData";
import { useVisibility } from "../hooks/useVisibility";
import { isEnvBrowser } from "../utils/misc";
import { fetchNui } from "../utils/fetchNui";

debugData([
  {
    action: "setRouter",
    data: "settings",
  },
]);

export const RouterCtx = createContext<RouterProviderProps>(
  {} as RouterProviderProps
);

export const RouterProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const { visible } = useVisibility();
  const [router, setRouter] = useState<PageTypes>("home");
  const [page, setPage] = useState<React.ReactNode | null>(null);

  useNuiEvent("setRouter", setRouter);

  useEffect(() => {
    if (router == "home") setPage(<Home />);
    if (router == "settings") setPage(<Settings />);
  }, [router]);

  useEffect(() => {
    if (!visible || router != "settings") return;
    const keyHandler = (e: KeyboardEvent) => {
      if (["Escape"].includes(e.code)) {
        if (!isEnvBrowser()) {
          fetchNui("OnHideSettingsMenu");
          setRouter("home");
        }
      }
    };
    window.addEventListener("keydown", keyHandler);
    return () => window.removeEventListener("keydown", keyHandler);
  }, [router, visible]);

  const value = useMemo(() => {
    return {
      router,
      setRouter,
      page,
    };
  }, [router, page]);

  return <RouterCtx.Provider value={value}>{children}</RouterCtx.Provider>;
};

export default RouterProvider;
