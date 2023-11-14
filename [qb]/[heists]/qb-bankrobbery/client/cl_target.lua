-- Table Fleeca
CreateThread(function() 
  for bank, _ in pairs(Config.FleecaBanks) do
    local position = Config.FleecaBanks[bank]['tablecoords']
      for _, loc in pairs(position) do
        if Config.TargetOption == 'bt' then 
          exports['bt-target']:AddBoxZone('qb-bank:CashGrab1'..math.random(1,100), vector3(loc['x'], loc['y'], loc['z']), 1.8, 1.8, { 
              name = 'qb-bank:CashGrab1'..math.random(1,100), 
              heading = 1,
              debugPoly = Config.debugPoly,
              minZ = loc['z'] - 1,
              maxZ = loc['z'] + 1,
            }, {
              options = { 
                { 
                  type = 'client',
                  event = 'qb-bankrobbery:grabcash',
                  icon = 'fas fa-hand-paper',
                  label = 'Grab Loot',
                  job = {'all'},
                }
              },
              distance = 1.0,
            })
        elseif Config.TargetOption == 'qb' then 
          exports['qb-target']:AddBoxZone('qb-bank:CashGrab1'..math.random(1,100), vector3(loc['x'], loc['y'], loc['z']), 1.8, 1.8, { 
            name = 'qb-bank:CashGrab1'..math.random(1,100), 
            heading = 1,
            debugPoly = Config.debugPoly,
            minZ = loc['z'] - 1,
            maxZ = loc['z'] + 1,
          }, {
            options = { 
              { 
                type = 'client',
                event = 'qb-bankrobbery:grabcash',
                icon = 'fas fa-hand-paper',
                label = 'Grab Loot',
                job = all,
              }
            },
            distance = 1.0,
          })
        elseif Config.TargetOption == 'berkie' then
          exports['berkie-target']:AddBoxZone('qb-bank:CashGrab1'..math.random(1,100), vector3(loc['x'], loc['y'], loc['z']), 1.8, 1.8, { 
            name = 'qb-bank:CashGrab1'..math.random(1,100), 
            heading = 1,
            debugPoly = Config.debugPoly,
            minZ = loc['z'] - 1,
            maxZ = loc['z'] + 1,
          }, {
            options = { 
              { 
                type = 'client',
                event = 'qb-bankrobbery:grabcash',
                icon = 'fas fa-hand-paper',
                label = 'Grab Loot',
                job = all,
              }
            },
            distance = 1.0,
          })
        end
    end
  end
end)


-- Drills Fleeca
CreateThread(function() 
  for bank, _ in pairs(Config.FleecaBanks) do
    for k,v in pairs(Config.FleecaBanks[bank]['drills']) do
        if Config.TargetOption == 'bt' then 
            exports['bt-target']:AddBoxZone('bankrobberyDrill'..math.random(1,100), vector3(Config.FleecaBanks[bank]['drills'][k]['coords'].x, Config.FleecaBanks[bank]['drills'][k]['coords'].y, Config.FleecaBanks[bank]['drills'][k]['coords'].z), 1.0, 0.8, { 
                name = 'bankrobberyDrill'..math.random(1,100), 
                heading = Config.FleecaBanks[bank]['drills'][k]['rotation'].z,
                debugPoly = Config.debugPoly,
                minZ = Config.FleecaBanks[bank]['drills'][k]['coords'].z-1,
                maxZ = Config.FleecaBanks[bank]['drills'][k]['coords'].z+1,
                }, {
                options = { 
                  { 
                    type = 'client',
                    event = 'qb-bankrobbery:DepositBox',
                    icon = 'fas fa-cookie',
                    label = 'Drill Saftey Box',
                    job = {'all'},
                  }
                },
                distance = 1.3,
            })
        elseif Config.TargetOption == 'qb' then
            exports['qb-target']:AddBoxZone('bankrobberyDrill'..math.random(1,100), vector3(Config.FleecaBanks[bank]['drills'][k]['coords'].x, Config.FleecaBanks[bank]['drills'][k]['coords'].y, Config.FleecaBanks[bank]['drills'][k]['coords'].z), 1.0, 0.8, {
                name = 'bankrobberyDrill'..math.random(1,100), 
                heading = Config.FleecaBanks[bank]['drills'][k]['rotation'].z,
                debugPoly = Config.debugPoly,
                minZ = Config.FleecaBanks[bank]['drills'][k]['coords'].z-1,
                maxZ = Config.FleecaBanks[bank]['drills'][k]['coords'].z+1,
                }, {
                options = { 
                  { 
                    type = 'client',
                    event = 'qb-bankrobbery:DepositBox',
                    icon = 'fas fa-cookie',
                    label = 'Drill Saftey Box',
                    job = all,
                  }
                },
                distance = 1.3,
          })
        elseif Config.TargetOption == 'berkie' then
          exports['berkie-target']:AddBoxZone('bankrobberyDrill'..math.random(1,100), vector3(Config.FleecaBanks[bank]['drills'][k]['coords'].x, Config.FleecaBanks[bank]['drills'][k]['coords'].y, Config.FleecaBanks[bank]['drills'][k]['coords'].z), 1.0, 0.8, {
              name = 'bankrobberyDrill'..math.random(1,100), 
              heading = Config.FleecaBanks[bank]['drills'][k]['rotation'].z,
              debugPoly = Config.debugPoly,
              minZ = Config.FleecaBanks[bank]['drills'][k]['coords'].z-1,
              maxZ = Config.FleecaBanks[bank]['drills'][k]['coords'].z+1,
              }, {
              options = { 
                { 
                  type = 'client',
                  event = 'qb-bankrobbery:DepositBox',
                  icon = 'fas fa-cookie',
                  label = 'Drill Saftey Box',
                  job = all,
                }
              },
              distance = 1.3,
        })
        end
    end
  end
end)

--  Trays Fleeca
CreateThread(function() 
  for bank, _ in pairs(Config.FleecaBanks) do
    for k,v in pairs(Config.FleecaBanks[bank]['trollys']) do
      if Config.TargetOption == 'bt' then 
          exports['bt-target']:AddBoxZone('LootTray'..math.random(1,100),  vector3(Config.FleecaBanks[bank]['trollys'][k]['coords'].x, Config.FleecaBanks[bank]['trollys'][k]['coords'].y, Config.FleecaBanks[bank]['trollys'][k]['coords'].z), 0.8, 1.0, { 
              name = 'LootTray'..math.random(1,100), 
              heading = Config.FleecaBanks[bank]['trollys'][k]['heading'],
              debugPoly = Config.debugPoly,
              minZ = Config.FleecaBanks[bank]['trollys'][k]['coords'].z-1,
              maxZ = Config.FleecaBanks[bank]['trollys'][k]['coords'].z+1,
              }, {
              options = { 
                { 
                  type = 'client',
                  event = 'qb-bankrobbery:loottray',
                  icon = 'fas fa-hand-paper',
                  label = 'Grab Loot',
                  job = {'all'},
                }
              },
              distance = 2.0,
          })
      elseif Config.TargetOption == 'qb' then
          exports['qb-target']:AddBoxZone('LootTray'..math.random(1,100), vector3(Config.FleecaBanks[bank]['trollys'][k]['coords'].x, Config.FleecaBanks[bank]['trollys'][k]['coords'].y, Config.FleecaBanks[bank]['trollys'][k]['coords'].z), 0.8, 1.0, {  
              name = 'LootTray'..math.random(1,100), 
              heading = Config.FleecaBanks[bank]['trollys'][k]['heading'],
              debugPoly = Config.debugPoly,
              minZ = Config.FleecaBanks[bank]['trollys'][k]['coords'].z-1,
              maxZ = Config.FleecaBanks[bank]['trollys'][k]['coords'].z+1,
              }, {
              options = { 
                { 
                  type = 'client',
                  event = 'qb-bankrobbery:loottray',
                  icon = 'fas fa-hand-paper',
                  label = 'Grab Loot',
                  job = all,
                }
              },
              distance = 2.0,
        })
      elseif Config.TargetOption == 'berkie' then
        exports['berkie-target']:AddBoxZone('LootTray'..math.random(1,100), vector3(Config.FleecaBanks[bank]['trollys'][k]['coords'].x, Config.FleecaBanks[bank]['trollys'][k]['coords'].y, Config.FleecaBanks[bank]['trollys'][k]['coords'].z), 0.8, 1.0, { 
            name = 'LootTray'..math.random(1,100), 
            heading = Config.FleecaBanks[bank]['trollys'][k]['heading'],
            debugPoly = Config.debugPoly,
            minZ = Config.FleecaBanks[bank]['trollys'][k]['coords'].z-1,
            maxZ = Config.FleecaBanks[bank]['trollys'][k]['coords'].z+1,
            }, {
            options = { 
              { 
                type = 'client',
                event = 'qb-bankrobbery:loottray',
                icon = 'fas fa-hand-paper',
                label = 'Grab Loot',
                job = all,
              }
            },
            distance = 2.0,
      })
      end
    end
  end
end)

-- table Paleto
CreateThread(function() 
  if Config.TargetOption == 'bt' then
      exports['bt-target']:AddBoxZone('qb-banklaptop:tablepaleto'..math.random(1,100), vector3(Config.PaletoBank['grab']['pos'].x, Config.PaletoBank['grab']['pos'].y, Config.PaletoBank['grab']['pos'].z), 1.3, 1.3, { 
          name = 'qb-banklaptop:tablepaleto'..math.random(1,100), 
          heading = Config.PaletoBank['grab']['heading'],
          debugPoly = Config.debugPoly, 
          minZ = Config.PaletoBank['grab']['pos'].z-1,
          maxZ = Config.PaletoBank['grab']['pos'].z+1,
      }, {
      options = { 
          { 
              type = 'client',
              event = 'qb-bankrobbery:tablepaleto',
              icon = 'fas fa-hand-paper',
              label = 'Grab Loot',
              job = {'all'},
          }
      },
          distance = 1.0,
      })
    elseif Config.TargetOption == 'qb' then 
      exports['qb-target']:AddBoxZone('qb-banklaptop:tablepaleto'..math.random(1,100), vector3(Config.PaletoBank['grab']['pos'].x, Config.PaletoBank['grab']['pos'].y, Config.PaletoBank['grab']['pos'].z), 1.3, 1.3, { 
        name = 'qb-banklaptop:tablepaleto'..math.random(1,100), 
        heading = Config.PaletoBank['grab']['heading'],
        debugPoly = Config.debugPoly, 
        minZ = Config.PaletoBank['grab']['pos'].z-1,
        maxZ = Config.PaletoBank['grab']['pos'].z+1,
    }, {
    options = { 
        { 
            type = 'client',
            event = 'qb-bankrobbery:tablepaleto',
            icon = 'fas fa-hand-paper',
            label = 'Grab Loot',
            job = all,
        }
    },
        distance = 1.0,
    })
    elseif Config.TargetOption == 'berkie' then 
      exports['berkie-target']:AddBoxZone('qb-banklaptop:tablepaleto'..math.random(1,100), vector3(Config.PaletoBank['grab']['pos'].x, Config.PaletoBank['grab']['pos'].y, Config.PaletoBank['grab']['pos'].z), 1.3, 1.3, { 
        name = 'qb-banklaptop:tablepaleto'..math.random(1,100), 
        heading = Config.PaletoBank['grab']['heading'],
        debugPoly = Config.debugPoly, 
        minZ = Config.PaletoBank['grab']['pos'].z-1,
        maxZ = Config.PaletoBank['grab']['pos'].z+1,
    }, {
    options = { 
        { 
            type = 'client',
            event = 'qb-bankrobbery:tablepaleto',
            icon = 'fas fa-hand-paper',
            label = 'Grab Loot',
            job = all,
        }
    },
        distance = 1.0,
    })
    end
end)

--  Trays Paleto
CreateThread(function() 
  for k,v in pairs(Config.PaletoBank['trollys']) do
        if Config.TargetOption == 'bt' then 
            exports['bt-target']:AddBoxZone('LootTray'..math.random(1,100), vector3(Config.PaletoBank['trollys'][k]['coords'].x, Config.PaletoBank['trollys'][k]['coords'].y, Config.PaletoBank['trollys'][k]['coords'].z), 0.8, 1.0, {
                name = 'LootTray'..math.random(1,100), 
                heading = Config.PaletoBank['trollys'][k]['heading'],
                debugPoly = Config.debugPoly,
                minZ = Config.PaletoBank['trollys'][k]['coords'].z-1,
                maxZ = Config.PaletoBank['trollys'][k]['coords'].z+1,
                }, {
                options = { 
                  { 
                    type = 'client',
                    event = 'qb-bankrobbery:PaletoTray',
                    icon = 'fas fa-hand-paper',
                    label = 'Grab Loot',
                    job = {'all'},
                  }
                },
                distance = 2.0,
            })
        elseif Config.TargetOption == 'qb' then
            exports['qb-target']:AddBoxZone('LootTray'..math.random(1,100), vector3(Config.PaletoBank['trollys'][k]['coords'].x, Config.PaletoBank['trollys'][k]['coords'].y, Config.PaletoBank['trollys'][k]['coords'].z), 0.8, 1.0, {
                name = 'LootTray'..math.random(1,100), 
                heading = Config.PaletoBank['trollys'][k]['heading'],
                debugPoly = Config.debugPoly, 
                minZ = Config.PaletoBank['trollys'][k]['coords'].z-1,
                maxZ = Config.PaletoBank['trollys'][k]['coords'].z+1,
                }, {
                options = { 
                  { 
                    type = 'client',
                    event = 'qb-bankrobbery:PaletoTray',
                    icon = 'fas fa-hand-paper',
                    label = 'Grab Loot',
                    job = all,
                  }
                },
                distance = 2.0,
          })
        elseif Config.TargetOption == 'berkie' then
          exports['berkie-target']:AddBoxZone('LootTray'..math.random(1,100), vector3(Config.PaletoBank['trollys'][k]['coords'].x, Config.PaletoBank['trollys'][k]['coords'].y, Config.PaletoBank['trollys'][k]['coords'].z), 0.8, 1.0, {
              name = 'LootTray'..math.random(1,100), 
              heading = Config.PaletoBank['trollys'][k]['heading'],
              debugPoly = Config.debugPoly,
              minZ = Config.PaletoBank['trollys'][k]['coords'].z-1,
              maxZ = Config.PaletoBank['trollys'][k]['coords'].z+1,
              }, {
              options = { 
                { 
                  type = 'client',
                  event = 'qb-bankrobbery:PaletoTray',
                  icon = 'fas fa-hand-paper',
                  label = 'Grab Loot',
                  job = all,
                }
              },
              distance = 2.0,
        })
        end
      end
end)

-- Drills Paleto
CreateThread(function() 
  for k,v in pairs(Config.PaletoBank['drills']) do
        if Config.TargetOption == 'bt' then 
            exports['bt-target']:AddBoxZone('PaletoDrill'..math.random(1,100), vector3(Config.PaletoBank['drills'][k]['coords'].x, Config.PaletoBank['drills'][k]['coords'].y, Config.PaletoBank['drills'][k]['coords'].z), 1.0, 0.8, { 
                name = 'PaletoDrill'..math.random(1,100), 
                heading = Config.PaletoBank['drills'][k]['rotation'].z,
                debugPoly = Config.debugPoly,
                minZ = Config.PaletoBank['drills'][k]['coords'].z-1,
                maxZ = Config.PaletoBank['drills'][k]['coords'].z+1,
                }, {
                options = { 
                  { 
                    type = 'client',
                    event = 'qb-bankrobbery:PaletoDrill',
                    icon = 'fas fa-cookie',
                    label = 'Drill Saftey Box',
                    job = {'all'},
                  }
                },
                distance = 1.3,
            })
        elseif Config.TargetOption == 'qb' then
            exports['qb-target']:AddBoxZone('PaletoDrill'..math.random(1,100), vector3(Config.PaletoBank['drills'][k]['coords'].x, Config.PaletoBank['drills'][k]['coords'].y, Config.PaletoBank['drills'][k]['coords'].z), 1.0, 0.8, { 
                name = 'PaletoDrill'..math.random(1,100), 
                heading = Config.PaletoBank['drills'][k]['rotation'].z,
                debugPoly = Config.debugPoly,
                minZ = Config.PaletoBank['drills'][k]['coords'].z-1,
                maxZ = Config.PaletoBank['drills'][k]['coords'].z+1,
                }, {
                options = { 
                  { 
                    type = 'client',
                    event = 'qb-bankrobbery:PaletoDrill',
                    icon = 'fas fa-cookie',
                    label = 'Drill Saftey Box',
                    job = all,
                  }
                },
                distance = 1.3,
          })
        elseif Config.TargetOption == 'berkie' then
          exports['berkie-target']:AddBoxZone('PaletoDrill'..math.random(1,100), vector3(Config.PaletoBank['drills'][k]['coords'].x, Config.PaletoBank['drills'][k]['coords'].y, Config.PaletoBank['drills'][k]['coords'].z), 1.0, 0.8, { 
            name = 'PaletoDrill'..math.random(1,100), 
              heading = Config.PaletoBank['drills'][k]['rotation'].z,
              debugPoly = Config.debugPoly,
              minZ = Config.PaletoBank['drills'][k]['coords'].z-1,
              maxZ = Config.PaletoBank['drills'][k]['coords'].z+1,
              }, {
              options = { 
                { 
                  type = 'client',
                  event = 'qb-bankrobbery:PaletoDrill',
                  icon = 'fas fa-cookie',
                  label = 'Drill Saftey Box',
                  job = all,
                }
              },
              distance = 1.3,
        })
        end
    end
end)

-- Paleto Thermite Doors
CreateThread(function() 
  for k,v in pairs(Config.PaletoBank['thermite']) do
    if Config.TargetOption == 'bt' then 
      exports['bt-target']:AddBoxZone('LootTray'..math.random(1,100), vector3(Config.PaletoBank['thermite'][k]['coords'].x, Config.PaletoBank['thermite'][k]['coords'].y, Config.PaletoBank['thermite'][k]['coords'].z), 0.4, 1.2, {
          name = 'LootTray'..math.random(1,100), 
          heading = Config.PaletoBank['thermite'][k]['coords'].w,
          debugPoly = Config.debugPoly,
          minZ = Config.PaletoBank['thermite'][k]['coords'].z-1,
          maxZ = Config.PaletoBank['thermite'][k]['coords'].z+1,
          }, {
          options = { 
            { 
              type = 'client',
              event = 'qb-bankrobbery:paleto:thermitedoor',
              icon = 'fas fa-bomb',
              label = 'Open Door',
              job = {'all'},
            }
          },
          distance = 1.2,
      })
    elseif Config.TargetOption == 'qb' then
      exports['qb-target']:AddBoxZone('OpenDoor'..math.random(1,100), vector3(Config.PaletoBank['thermite'][k]['coords'].x, Config.PaletoBank['thermite'][k]['coords'].y, Config.PaletoBank['thermite'][k]['coords'].z), 0.4, 1.2, {
          name = 'OpenDoor'..math.random(1,100), 
          heading = Config.PaletoBank['thermite'][k]['coords'].w,
          debugPoly = Config.debugPoly, 
          minZ = Config.PaletoBank['thermite'][k]['coords'].z-1,
          maxZ = Config.PaletoBank['thermite'][k]['coords'].z+1,
          }, {
          options = { 
            { 
              type = 'client',
              event = 'qb-bankrobbery:paleto:thermitedoor',
              icon = 'fas fa-bomb',
              label = 'Open Door',
              job = all,
            }
          },
          distance = 1.2,
    })
    elseif Config.TargetOption == 'berkie' then
      exports['berkie-target']:AddBoxZone('OpenDoor'..math.random(1,100), vector3(Config.PaletoBank['thermite'][k]['coords'].x, Config.PaletoBank['thermite'][k]['coords'].y, Config.PaletoBank['thermite'][k]['coords'].z), 0.3, 1.4, {
        name = 'OpenDoor'..math.random(1,100), 
        heading = Config.PaletoBank['thermite'][k]['coords'].w,
        debugPoly = Config.debugPoly,
        minZ = Config.PaletoBank['thermite'][k]['coords'].z-1,
        maxZ = Config.PaletoBank['thermite'][k]['coords'].z+1,
        }, {
        options = { 
          { 
            type = 'client',
            event = 'qb-bankrobbery:paleto:thermitedoor',
            icon = 'fas fa-bomb',
            label = 'Open Door',
            job = all,
          }
        },
        distance = 1.2,
    })
    end
  end
end)


-- Pacific Thermite Doors
CreateThread(function() 
    for k,v in pairs(Config.PacificBank['thermite']) do
      if Config.TargetOption == 'bt' then 
        exports['bt-target']:AddBoxZone('ThermtieDoor'..math.random(1,100), vector3(Config.PacificBank['thermite'][k]['coords'].x, Config.PacificBank['thermite'][k]['coords'].y, Config.PacificBank['thermite'][k]['coords'].z), 0.4, 1.2, {
            name = 'ThermtieDoor'..math.random(1,100), 
            heading = Config.PacificBank['thermite'][k]['coords'].w,
            debugPoly = Config.debugPoly,
            minZ = Config.PacificBank['thermite'][k]['coords'].z-1,
            maxZ = Config.PacificBank['thermite'][k]['coords'].z+1,
            }, {
            options = { 
              { 
                type = 'client',
                event = 'qb-bankrobbery:pacific:thermitedoor',
                icon = 'fas fa-bomb',
                label = 'Open Door',
                job = {'all'},
              }
            },
            distance = 1.2,
        })
      elseif Config.TargetOption == 'qb' then
        exports['qb-target']:AddBoxZone('ThermtieDoor'..math.random(1,100), vector3(Config.PacificBank['thermite'][k]['coords'].x, Config.PacificBank['thermite'][k]['coords'].y, Config.PacificBank['thermite'][k]['coords'].z), 0.4, 1.2, {
            name = 'ThermtieDoor'..math.random(1,100), 
            heading = Config.PacificBank['thermite'][k]['coords'].w,
            debugPoly = Config.debugPoly, 
            minZ = Config.PacificBank['thermite'][k]['coords'].z-1,
            maxZ = Config.PacificBank['thermite'][k]['coords'].z+1,
            }, {
            options = { 
              { 
                type = 'client',
                event = 'qb-bankrobbery:pacific:thermitedoor',
                icon = 'fas fa-bomb',
                label = 'Open Door',
                job = all,
              }
            },
            distance = 1.2,
      })
      elseif Config.TargetOption == 'berkie' then
        exports['berkie-target']:AddBoxZone('ThermtieDoor'..math.random(1,100), vector3(Config.PacificBank['thermite'][k]['coords'].x, Config.PacificBank['thermite'][k]['coords'].y, Config.PacificBank['thermite'][k]['coords'].z), 0.3, 1.4, {
          name = 'ThermtieDoor'..math.random(1,100), 
          heading = Config.PacificBank['thermite'][k]['coords'].w,
          debugPoly = Config.debugPoly,
          minZ = Config.PacificBank['thermite'][k]['coords'].z-1,
          maxZ = Config.PacificBank['thermite'][k]['coords'].z+1,
          }, {
          options = { 
            { 
              type = 'client',
              event = 'qb-bankrobbery:pacific:thermitedoor',
              icon = 'fas fa-bomb',
              label = 'Open Door',
              job = all,
            }
          },
          distance = 1.2,
      })
      end
    end
  end)

-- table Pacific
CreateThread(function() 
if Config.TargetOption == 'bt' then
    exports['bt-target']:AddBoxZone('qb-banklaptop:tablepacific'..math.random(1,100), vector3(Config.PacificBank['grab']['pos'].x, Config.PacificBank['grab']['pos'].y, Config.PacificBank['grab']['pos'].z), 1.3, 1.3, { 
        name = 'qb-banklaptop:tablepacific'..math.random(1,100), 
        heading = Config.PacificBank['grab']['heading'],
        debugPoly = Config.debugPoly, 
        minZ = Config.PacificBank['grab']['pos'].z-1,
        maxZ = Config.PacificBank['grab']['pos'].z+1,
    }, {
    options = { 
        { 
            type = 'client',
            event = 'qb-bankrobbery:tablepacific',
            icon = 'fas fa-hand-paper',
            label = 'Grab Loot',
            job = {'all'},
        }
    },
        distance = 1.0,
    })
  elseif Config.TargetOption == 'qb' then 
    exports['qb-target']:AddBoxZone('qb-banklaptop:tablepacific'..math.random(1,100), vector3(Config.PacificBank['grab']['pos'].x, Config.PacificBank['grab']['pos'].y, Config.PacificBank['grab']['pos'].z), 1.3, 1.3, { 
      name = 'qb-banklaptop:tablepacific'..math.random(1,100), 
      heading = Config.PacificBank['grab']['heading'],
      debugPoly = Config.debugPoly, 
      minZ = Config.PacificBank['grab']['pos'].z-1,
      maxZ = Config.PacificBank['grab']['pos'].z+1,
  }, {
  options = { 
      { 
          type = 'client',
          event = 'qb-bankrobbery:tablepacific',
          icon = 'fas fa-hand-paper',
          label = 'Grab Loot',
          job = all,
      }
  },
      distance = 1.0,
  })
  elseif Config.TargetOption == 'berkie' then 
    exports['berkie-target']:AddBoxZone('qb-banklaptop:tablepacific'..math.random(1,100), vector3(Config.PacificBank['grab']['pos'].x, Config.PacificBank['grab']['pos'].y, Config.PacificBank['grab']['pos'].z), 1.3, 1.3, { 
      name = 'qb-banklaptop:tablepacific'..math.random(1,100), 
      heading = Config.PacificBank['grab']['heading'],
      debugPoly = Config.debugPoly, 
      minZ = Config.PacificBank['grab']['pos'].z-1,
      maxZ = Config.PacificBank['grab']['pos'].z+1,
  }, {
  options = { 
      { 
          type = 'client',
          event = 'qb-bankrobbery:tablepacific',
          icon = 'fas fa-hand-paper',
          label = 'Grab Loot',
          job = all,
      }
  },
      distance = 1.0,
  })
  end
end)

--  Trays Pacific
CreateThread(function() 
for k,v in pairs(Config.PacificBank['trollys']) do
      if Config.TargetOption == 'bt' then 
          exports['bt-target']:AddBoxZone('trayPacific'..math.random(1,100), vector3(Config.PacificBank['trollys'][k]['coords'].x, Config.PacificBank['trollys'][k]['coords'].y, Config.PacificBank['trollys'][k]['coords'].z), 0.8, 1.0, {
              name = 'trayPacific'..math.random(1,100), 
              heading = Config.PacificBank['trollys'][k]['heading'],
              debugPoly = Config.debugPoly,
              minZ = Config.PacificBank['trollys'][k]['coords'].z-1,
              maxZ = Config.PacificBank['trollys'][k]['coords'].z+1,
              }, {
              options = { 
                { 
                  type = 'client',
                  event = 'qb-bankrobbery:PacificTray',
                  icon = 'fas fa-hand-paper',
                  label = 'Grab Loot',
                  job = {'all'},
                }
              },
              distance = 2.0,
          })
      elseif Config.TargetOption == 'qb' then
          exports['qb-target']:AddBoxZone('trayPacific'..math.random(1,100), vector3(Config.PacificBank['trollys'][k]['coords'].x, Config.PacificBank['trollys'][k]['coords'].y, Config.PacificBank['trollys'][k]['coords'].z), 0.8, 1.0, {
              name = 'trayPacific'..math.random(1,100), 
              heading = Config.PacificBank['trollys'][k]['heading'],
              debugPoly = Config.debugPoly, 
              minZ = Config.PacificBank['trollys'][k]['coords'].z-1,
              maxZ = Config.PacificBank['trollys'][k]['coords'].z+1,
              }, {
              options = { 
                { 
                  type = 'client',
                  event = 'qb-bankrobbery:PacificTray',
                  icon = 'fas fa-hand-paper',
                  label = 'Grab Loot',
                  job = all,
                }
              },
              distance = 2.0,
        })
      elseif Config.TargetOption == 'berkie' then
        exports['berkie-target']:AddBoxZone('trayPacific'..math.random(1,100), vector3(Config.PacificBank['trollys'][k]['coords'].x, Config.PacificBank['trollys'][k]['coords'].y, Config.PacificBank['trollys'][k]['coords'].z), 0.8, 1.0, {
            name = 'trayPacific'..math.random(1,100), 
            heading = Config.PacificBank['trollys'][k]['heading'],
            debugPoly = Config.debugPoly,
            minZ = Config.PacificBank['trollys'][k]['coords'].z-1,
            maxZ = Config.PacificBank['trollys'][k]['coords'].z+1,
            }, {
            options = { 
              { 
                type = 'client',
                event = 'qb-bankrobbery:PacificTray',
                icon = 'fas fa-hand-paper',
                label = 'Grab Loot',
                job = all,
              }
            },
            distance = 2.0,
      })
      end
    end
end)

-- Drills Pacific
CreateThread(function() 
for k,v in pairs(Config.PacificBank['drills']) do
      if Config.TargetOption == 'bt' then 
          exports['bt-target']:AddBoxZone('PacificDrill'..math.random(1,100), vector3(Config.PacificBank['drills'][k]['coords'].x, Config.PacificBank['drills'][k]['coords'].y, Config.PacificBank['drills'][k]['coords'].z), 1.0, 0.8, { 
              name = 'PacificDrill'..math.random(1,100), 
              heading = Config.PacificBank['drills'][k]['rotation'].z,
              debugPoly = Config.debugPoly,
              minZ = Config.PacificBank['drills'][k]['coords'].z-1,
              maxZ = Config.PacificBank['drills'][k]['coords'].z+1,
              }, {
              options = { 
                { 
                  type = 'client',
                  event = 'qb-bankrobbery:PacificDrill',
                  icon = 'fas fa-cookie',
                  label = 'Drill Saftey Box',
                  job = {'all'},
                }
              },
              distance = 1.3,
          })
      elseif Config.TargetOption == 'qb' then
          exports['qb-target']:AddBoxZone('PacificDrill'..math.random(1,100), vector3(Config.PacificBank['drills'][k]['coords'].x, Config.PacificBank['drills'][k]['coords'].y, Config.PacificBank['drills'][k]['coords'].z), 1.0, 0.8, { 
              name = 'PacificDrill'..math.random(1,100), 
              heading = Config.PacificBank['drills'][k]['rotation'].z,
              debugPoly = Config.debugPoly,
              minZ = Config.PacificBank['drills'][k]['coords'].z-1,
              maxZ = Config.PacificBank['drills'][k]['coords'].z+1,
              }, {
              options = { 
                { 
                  type = 'client',
                  event = 'qb-bankrobbery:PacificDrill',
                  icon = 'fas fa-cookie',
                  label = 'Drill Saftey Box',
                  job = all,
                }
              },
              distance = 1.3,
        })
      elseif Config.TargetOption == 'berkie' then
        exports['berkie-target']:AddBoxZone('PacificDrill'..math.random(1,100), vector3(Config.PacificBank['drills'][k]['coords'].x, Config.PacificBank['drills'][k]['coords'].y, Config.PacificBank['drills'][k]['coords'].z), 1.0, 0.8, { 
            name = 'PacificDrill'..math.random(1,100), 
            heading = Config.PacificBank['drills'][k]['rotation'].z,
            debugPoly = Config.debugPoly,
            minZ = Config.PacificBank['drills'][k]['coords'].z-1,
            maxZ = Config.PacificBank['drills'][k]['coords'].z+1,
            }, {
            options = { 
              { 
                type = 'client',
                event = 'qb-bankrobbery:PacificDrill',
                icon = 'fas fa-cookie',
                label = 'Drill Saftey Box',
                job = all,
              }
            },
            distance = 1.3,
      })
      end
  end
end)


-- lowerVault Servers
CreateThread(function()
  for k,v in pairs(Config.lowerVault['elecbox']) do
      if Config.lowerVaultEnabled == 'true' then
          if Config.TargetOption == 'bt' then 
              exports['bt-target']:AddBoxZone('elecbox'..math.random(1,100), vector3(Config.lowerVault['elecbox'][k]['coords'].x, Config.lowerVault['elecbox'][k]['coords'].y, Config.lowerVault['elecbox'][k]['coords'].z), 0.9, 0.9, {
                  name = 'elecbox'..math.random(1,100), 
                  heading = Config.lowerVault['elecbox'][k]['coords'].w,
                  debugPoly = Config.debugPoly,
                  minZ = Config.lowerVault['elecbox'][k]['coords'].z-1,
                  maxZ = Config.lowerVault['elecbox'][k]['coords'].z+2, 
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:electricbox',
                          icon = 'fas fa-hdd',
                          label = 'Take Hard Drive',
                          job = {'all'},
                      }
                  },
                  distance = 1.5,

              })
          elseif Config.TargetOption == 'qb' then
              exports['qb-target']:AddBoxZone('elecbox'..math.random(1,100), vector3(Config.lowerVault['elecbox'][k]['coords'].x, Config.lowerVault['elecbox'][k]['coords'].y, Config.lowerVault['elecbox'][k]['coords'].z), 0.9, 0.9, {
                  name = 'elecbox'..math.random(1,100), 
                  heading = Config.lowerVault['elecbox'][k]['coords'].w,
                  debugPoly = Config.debugPoly,
                  minZ = Config.lowerVault['elecbox'][k]['coords'].z-1,
                  maxZ = Config.lowerVault['elecbox'][k]['coords'].z+2, 
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:electricbox',
                          icon = 'fas fa-hdd',
                          label = 'Take Hard Drive',
                          job = all,
                      }
                  },
                  distance = 1.5,

              })
          elseif Config.TargetOption == 'berkie' then
              exports['berkie-target']:AddBoxZone('elecbox'..math.random(1,100), vector3(Config.lowerVault['elecbox'][k]['coords'].x, Config.lowerVault['elecbox'][k]['coords'].y, Config.lowerVault['elecbox'][k]['coords'].z), 0.9, 0.9, {
                  name = 'elecbox'..math.random(1,100), 
                  heading = Config.lowerVault['elecbox'][k]['coords'].w,
                  debugPoly = Config.debugPoly,
                  minZ = Config.lowerVault['elecbox'][k]['coords'].z-1,
                  maxZ = Config.lowerVault['elecbox'][k]['coords'].z+2, 
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:electricbox',
                          icon = 'fas fa-hdd',
                          label = 'Take Hard Drive',
                          job = all,
                      }
                  },
                  distance = 1.5,

              })
          end
      end
  end
end)


-- lowerVault Doors
CreateThread(function()
  for k,v in pairs(Config.lowerVault['doors']) do
      if Config.lowerVaultEnabled == 'true' then
          if Config.TargetOption == 'bt' then 
              exports['bt-target']:AddBoxZone('LowerDoors'..math.random(1,100), vector3(Config.lowerVault['doors'][k]['coords'].x, Config.lowerVault['doors'][k]['coords'].y, Config.lowerVault['doors'][k]['coords'].z), 0.3, 1.5, {
                  name = 'LowerDoors'..math.random(1,100), 
                  heading = Config.lowerVault['doors'][k]['coords'].w,
                  debugPoly = Config.debugPoly,
                  minZ = Config.lowerVault['doors'][k]['coords'].z-1,
                  maxZ = Config.lowerVault['doors'][k]['coords'].z+1.3, 
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:lowerDoors',
                          icon = 'fas fa-bomb',
                          label = 'Open Door',
                          job = {'all'},
                      }
                  },
                  distance = 1.5,

              })
          elseif Config.TargetOption == 'qb' then
              exports['qb-target']:AddBoxZone('LowerDoors'..math.random(1,100), vector3(Config.lowerVault['doors'][k]['coords'].x, Config.lowerVault['doors'][k]['coords'].y, Config.lowerVault['doors'][k]['coords'].z), 0.3, 1.5, {
                  name = 'LowerDoors'..math.random(1,100), 
                  heading = Config.lowerVault['doors'][k]['coords'].w,
                  debugPoly = Config.debugPoly,
                  minZ = Config.lowerVault['doors'][k]['coords'].z-1,
                  maxZ = Config.lowerVault['doors'][k]['coords'].z+1.3, 
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:lowerDoors',
                          icon = 'fas fa-bomb',
                          label = 'Open Door',
                          job = all,
                      }
                  },
                  distance = 1.5,

              })
          elseif Config.TargetOption == 'berkie' then
              exports['berkie-target']:AddBoxZone('LowerDoors'..math.random(1,100), vector3(Config.lowerVault['doors'][k]['coords'].x, Config.lowerVault['doors'][k]['coords'].y, Config.lowerVault['doors'][k]['coords'].z), 0.3, 1.5, {
                  name = 'LowerDoors'..math.random(1,100), 
                  heading = Config.lowerVault['doors'][k]['coords'].w,
                  debugPoly = Config.debugPoly,
                  minZ = Config.lowerVault['doors'][k]['coords'].z-1,
                  maxZ = Config.lowerVault['doors'][k]['coords'].z+1.3, 
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:lowerDoors',
                          icon = 'fas fa-bomb',
                          label = 'Open Door',
                          job = all,
                      }
                  },
                  distance = 1.5,

              })
            end
        end
    end
end)

-- lowerVault Gold Tables
CreateThread(function()
  for k,v in pairs(Config.lowerVault['grabGold']) do
      if Config.lowerVaultEnabled == 'true' then
          if Config.TargetOption == 'bt' then 
              exports['bt-target']:AddBoxZone('LowerTables'..math.random(1,100), vector3(Config.lowerVault['grabGold'][k]['coords'].x, Config.lowerVault['grabGold'][k]['coords'].y, Config.lowerVault['grabGold'][k]['coords'].z), 0.6, 1.8, {
                  name = 'LowerTables'..math.random(1,100), 
                  heading = Config.lowerVault['grabGold'][k]['heading'],
                  debugPoly = Config.debugPoly,
                  minZ = Config.lowerVault['grabGold'][k]['coords'].z,
                  maxZ = Config.lowerVault['grabGold'][k]['coords'].z+0.5,
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:lowerVaultGrabGold',
                          icon = 'fas fa-hand-paper',
                          label = 'Grab Gold',
                          job = {'all'},
                      }
                  },
                  distance = 1.6,

              })
          elseif Config.TargetOption == 'qb' then
              exports['qb-target']:AddBoxZone('LowerTables'..math.random(1,100), vector3(Config.lowerVault['grabGold'][k]['coords'].x, Config.lowerVault['grabGold'][k]['coords'].y, Config.lowerVault['grabGold'][k]['coords'].z), 0.6, 1.5, {
                  name = 'LowerTables'..math.random(1,100), 
                  heading = Config.lowerVault['grabGold'][k]['heading'],
                  debugPoly = Config.debugPoly,
                  minZ = Config.lowerVault['grabGold'][k]['coords'].z,
                  maxZ = Config.lowerVault['grabGold'][k]['coords'].z+0.5,
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:lowerVaultGrabGold',
                          icon = 'fas fa-hand-paper',
                          label = 'Grab Gold',
                          job = all,
                      }
                  },
                  distance = 1.6,

              })
          elseif Config.TargetOption == 'berkie' then
              exports['berkie-target']:AddBoxZone('LowerTables'..math.random(1,100), vector3(Config.lowerVault['grabGold'][k]['coords'].x, Config.lowerVault['grabGold'][k]['coords'].y, Config.lowerVault['grabGold'][k]['coords'].z), 0.6, 1.5, {
                  name = 'LowerTables'..math.random(1,100), 
                  heading = Config.lowerVault['grabGold'][k]['heading'],
                  debugPoly = Config.debugPoly,
                  minZ = Config.lowerVault['grabGold'][k]['coords'].z,
                  maxZ = Config.lowerVault['grabGold'][k]['coords'].z+0.5, 
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:lowerVaultGrabGold',
                          icon = 'fas fa-hand-paper',
                          label = 'Grab Gold',
                          job = all,
                      }
                  },
                  distance = 6.6,

              })
          end
      end
  end
end)

-- lowerVault Cash Tables
CreateThread(function()
    for k,v in pairs(Config.lowerVault['grabCash']) do
        if Config.lowerVaultEnabled == 'true' then
            if Config.TargetOption == 'bt' then 
                exports['bt-target']:AddBoxZone('LowerTables'..math.random(1,100), vector3(Config.lowerVault['grabCash'][k]['coords'].x, Config.lowerVault['grabCash'][k]['coords'].y, Config.lowerVault['grabCash'][k]['coords'].z), 0.6, 1.8, {
                    name = 'LowerTables'..math.random(1,100), 
                    heading = Config.lowerVault['grabCash'][k]['heading'],
                    debugPoly = Config.debugPoly,
                    minZ = Config.lowerVault['grabCash'][k]['coords'].z,
                    maxZ = Config.lowerVault['grabCash'][k]['coords'].z+0.5,
                }, {
                    options = {
                        {
                            type = 'client',
                            event = 'qb-bankrobbery:lowerVaultGrabCash',
                            icon = 'fas fa-hand-paper',
                            label = 'Grab cash',
                            job = {'all'},
                        }
                    },
                    distance = 1.6,
  
                })
            elseif Config.TargetOption == 'qb' then
                exports['qb-target']:AddBoxZone('LowerTables'..math.random(1,100), vector3(Config.lowerVault['grabCash'][k]['coords'].x, Config.lowerVault['grabCash'][k]['coords'].y, Config.lowerVault['grabCash'][k]['coords'].z), 0.6, 1.5, {
                    name = 'LowerTables'..math.random(1,100), 
                    heading = Config.lowerVault['grabCash'][k]['heading'],
                    debugPoly = Config.debugPoly,
                    minZ = Config.lowerVault['grabCash'][k]['coords'].z,
                    maxZ = Config.lowerVault['grabCash'][k]['coords'].z+0.5,
                }, {
                    options = {
                        {
                            type = 'client',
                            event = 'qb-bankrobbery:lowerVaultGrabCash',
                            icon = 'fas fa-hand-paper',
                            label = 'Grab Cash',
                            job = all,
                        }
                    },
                    distance = 1.6,
  
                })
            elseif Config.TargetOption == 'berkie' then
                exports['berkie-target']:AddBoxZone('LowerTables'..math.random(1,100), vector3(Config.lowerVault['grabCash'][k]['coords'].x, Config.lowerVault['grabCash'][k]['coords'].y, Config.lowerVault['grabCash'][k]['coords'].z), 0.6, 1.5, {
                    name = 'LowerTables'..math.random(1,100), 
                    heading = Config.lowerVault['grabCash'][k]['heading'],
                    debugPoly = Config.debugPoly,
                    minZ = Config.lowerVault['grabCash'][k]['coords'].z,
                    maxZ = Config.lowerVault['grabCash'][k]['coords'].z+0.5, 
                }, {
                    options = {
                        {
                            type = 'client',
                            event = 'qb-bankrobbery:lowerVaultGrabCash',
                            icon = 'fas fa-hand-paper',
                            label = 'Grab Cash',
                            job = all,
                        }
                    },
                    distance = 6.6,
  
                })
            end
        end
    end
  end)

  --  lowerVault diamond trays
CreateThread(function() 
    for k,v in pairs(Config.lowerVault['trays']) do
          if Config.TargetOption == 'bt' then 
              exports['bt-target']:AddBoxZone('lvdiamonds'..math.random(1,100), vector3(Config.lowerVault['trays'][k]['coords'].x, Config.lowerVault['trays'][k]['coords'].y, Config.lowerVault['trays'][k]['coords'].z), 0.8, 1.0, {
                  name = 'lvdiamonds'..math.random(1,100), 
                  heading = Config.lowerVault['trays'][k]['coords'].w,
                  debugPoly = Config.debugPoly,
                  minZ = Config.lowerVault['trays'][k]['coords'].z,
                  maxZ = Config.lowerVault['trays'][k]['coords'].z+1,
                  }, {
                  options = { 
                    { 
                      type = 'client',
                      event = 'qb-bankrobbery:lowerVaultDiamonds',
                      icon = 'fas fa-hand-paper',
                      label = 'Grab Diamonds',
                      job = {'all'},
                    }
                  },
                  distance = 2.0,
              })
          elseif Config.TargetOption == 'qb' then
              exports['qb-target']:AddBoxZone('lvdiamonds'..math.random(1,100), vector3(Config.lowerVault['trays'][k]['coords'].x, Config.lowerVault['trays'][k]['coords'].y, Config.lowerVault['trays'][k]['coords'].z), 0.8, 1.0, {
                  name = 'lvdiamonds'..math.random(1,100), 
                  heading = Config.lowerVault['trays'][k]['coords'].w,
                  debugPoly = Config.debugPoly, 
                  minZ = Config.lowerVault['trays'][k]['coords'].z,
                  maxZ = Config.lowerVault['trays'][k]['coords'].z+1,
                  }, {
                  options = { 
                    { 
                      type = 'client',
                      event = 'qb-bankrobbery:lowerVaultDiamonds',
                      icon = 'fas fa-hand-paper',
                      label = 'Grab Diamonds',
                      job = all,
                    }
                  },
                  distance = 2.0,
            })
          elseif Config.TargetOption == 'berkie' then
            exports['berkie-target']:AddBoxZone('lvdiamonds'..math.random(1,100), vector3(Config.lowerVault['trays'][k]['coords'].x, Config.lowerVault['trays'][k]['coords'].y, Config.lowerVault['trays'][k]['coords'].z), 0.8, 1.0, {
                name = 'lvdiamonds'..math.random(1,100), 
                heading = Config.lowerVault['trays'][k]['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.lowerVault['trays'][k]['coords'].z,
                maxZ = Config.lowerVault['trays'][k]['coords'].z+1,
                }, {
                options = { 
                  { 
                    type = 'client',
                    event = 'qb-bankrobbery:lowerVaultDiamonds',
                    icon = 'fas fa-hand-paper',
                    label = 'Grab Diamonds',
                    job = all,
                  }
                },
                distance = 2.0,
          })
          end
        end
    end)

-- Lower vault Computer hacking
CreateThread(function()
    if Config.lowerVaultEnabled == 'true' then
        if Config.TargetOption == 'bt' then 
            exports['bt-target']:AddBoxZone('HackDrive'..math.random(1,100), vector3(Config.lowerVault['computer'].x, Config.lowerVault['computer'].y, Config.lowerVault['computer'].z), 0.6, 0.6, {
                name = 'HackDrive'..math.random(1,100), 
                heading = Config.lowerVault['computer'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.lowerVault['computer'].z-2,
                maxZ = Config.lowerVault['computer'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:client:HackDrive',
                        icon = 'fas fa-hdd',
                        label = 'Decrypt Hard Drive',
                        job = {'all'},
                    }
                },
                distance = 1.5,

            })
        elseif Config.TargetOption == 'qb' then
            exports['qb-target']:AddBoxZone('HackDrive'..math.random(1,100), vector3(Config.lowerVault['computer'].x, Config.lowerVault['computer'].y, Config.lowerVault['computer'].z), 0.6, 0.6, {
                name = 'HackDrive'..math.random(1,100), 
                heading = Config.lowerVault['computer'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.lowerVault['computer'].z-2,
                maxZ = Config.lowerVault['computer'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:client:HackDrive',
                        icon = 'fas fa-hdd',
                        label = 'Decrypt Hard Drive',
                        job = all,
                    }
                },
                distance = 1.5,

            })
        elseif Config.TargetOption == 'berkie' then
            exports['berkie-target']:AddBoxZone('HackDrive'..math.random(1,100), vector3(Config.lowerVault['computer'].x, Config.lowerVault['computer'].y, Config.lowerVault['computer'].z), 0.6, 0.6, {
                name = 'HackDrive'..math.random(1,100), 
                heading = Config.lowerVault['computer'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.lowerVault['computer'].z-2,
                maxZ = Config.lowerVault['computer'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:client:HackDrive',
                        icon = 'fas fa-hdd',
                        label = 'Decrypt Hard Drive',
                        job = all,
                    }
                },
                distance = 1.5,
            })
        end
    end
end)

-- Lower Vault Code placement
CreateThread(function()
    if Config.lowerVaultEnabled == 'true' then
        if Config.TargetOption == 'bt' then 
            exports['bt-target']:AddBoxZone('InsertCode'..math.random(1,100), vector3(Config.lowerVault['coords'].x, Config.lowerVault['coords'].y, Config.lowerVault['coords'].z), 1.6, 1.6, {
                name = 'InsertCode'..math.random(1,100), 
                heading = Config.lowerVault['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.lowerVault['coords'].z-2,
                maxZ = Config.lowerVault['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:client:EnterlowerVaultCode1',
                        icon = 'fas fa-keyboard',
                        label = 'Code 1',
                        job = {'all'},
                    },
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:client:EnterlowerVaultCode2',
                        icon = 'fas fa-keyboard',
                        label = 'Code 2',
                        job = {'all'},
                    }
                },
                distance = 1.5,

            })
        elseif Config.TargetOption == 'qb' then
            exports['qb-target']:AddBoxZone('InsertCode'..math.random(1,100), vector3(Config.lowerVault['coords'].x, Config.lowerVault['coords'].y, Config.lowerVault['coords'].z), 1.5, 2.5, {
                name = 'InsertCode'..math.random(1,100), 
                heading = Config.lowerVault['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.lowerVault['coords'].z-2,
                maxZ = Config.lowerVault['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:client:EnterlowerVaultCode1',
                        icon = 'fas fa-keyboard',
                        label = 'Code 1',
                    },
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:client:EnterlowerVaultCode2',
                        icon = 'fas fa-keyboard',
                        label = 'Code 2',
                    }
                },
                distance = 1.5,

            })
        elseif Config.TargetOption == 'berkie' then
            exports['berkie-target']:AddBoxZone('InsertCode'..math.random(1,100), vector3(Config.lowerVault['coords'].x, Config.lowerVault['coords'].y, Config.lowerVault['coords'].z), 2.5, 2.5, {
                name = 'InsertCode'..math.random(1,100), 
                heading = Config.lowerVault['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.lowerVault['coords'].z-2,
                maxZ = Config.lowerVault['coords'].z+2, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:client:EnterlowerVaultCode1',
                        icon = 'fas fa-keyboard',
                        label = 'Code 1',
                    },
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:client:EnterlowerVaultCode2',
                        icon = 'fas fa-keyboard',
                        label = 'Code 2',
                    }
                },
                distance = 2.5,
            })
        end
    end
end)

-- lowerVault Glass Display
CreateThread(function()
  if Config.lowerVaultEnabled == 'true' then
      if Config.TargetOption == 'bt' then 
          exports['bt-target']:AddBoxZone('GlassDisplay'..math.random(1,100), vector3(Config.lowerVault['display']['coords'].x, Config.lowerVault['display']['coords'].y, Config.lowerVault['display']['coords'].z), 1, 1, {
              name = 'GlassDisplay'..math.random(1,100), 
              heading = Config.lowerVault['display'].w,
              debugPoly = Config.debugPoly,
              minZ = Config.lowerVault['display']['coords'].z-2,
              maxZ = Config.lowerVault['display']['coords'].z+1, 
          }, {
              options = {
                  {
                      type = 'client',
                      event = 'qb-bankrobbery:displayCase',
                      icon = 'fas fa-keyboard',
                      label = 'Take Loot',
                      job = {'all'},
                  }
              },
              distance = 1.5,

          })
      elseif Config.TargetOption == 'qb' then
          exports['qb-target']:AddBoxZone('GlassDisplay'..math.random(1,100), vector3(Config.lowerVault['display']['coords'].x, Config.lowerVault['display']['coords'].y, Config.lowerVault['display']['coords'].z), 1, 1, {
              name = 'GlassDisplay'..math.random(1,100), 
              heading = Config.lowerVault['display']['coords'].w,
              debugPoly = Config.debugPoly,
              minZ = Config.lowerVault['display']['coords'].z-2,
              maxZ = Config.lowerVault['display']['coords'].z+1, 
          }, {
              options = {
                  {
                      type = 'client',
                      event = 'qb-bankrobbery:displayCase',
                      icon = 'fas fa-keyboard',
                      label = 'Take Loot',
                  }
              },
              distance = 1.5,

          })
      elseif Config.TargetOption == 'berkie' then
          exports['berkie-target']:AddBoxZone('GlassDisplay'..math.random(1,100), vector3(Config.lowerVault['display']['coords'].x, Config.lowerVault['display']['coords'].y, Config.lowerVault['display']['coords'].z), 1, 1, {
              name = 'GlassDisplay'..math.random(1,100), 
              heading = Config.lowerVault['display']['coords'].w,
              debugPoly = Config.debugPoly,
              minZ = Config.lowerVault['display']['coords'].z-2,
              maxZ = Config.lowerVault['display']['coords'].z+2, 
          }, {
              options = {
                  {
                      type = 'client',
                      event = 'qb-bankrobbery:displayCase',
                      icon = 'fas fa-keyboard',
                      label = 'Take Loot',
                  }
              },
              distance = 2.5,
          })
      end
  end
end)


-- PowerPlant Place Bomb
CreateThread(function()
  for k,v in pairs(Config.PowerPlant['locations']) do
      if Config.lowerVaultEnabled == 'true' then
          if Config.TargetOption == 'bt' then 
              exports['bt-target']:AddBoxZone('placeExplosive'..math.random(1,100), vector3(Config.PowerPlant['locations'][k]['coords'].x, Config.PowerPlant['locations'][k]['coords'].y, Config.PowerPlant['locations'][k]['coords'].z), 0.6, 1.5, {
                  name = 'placeExplosive'..math.random(1,100), 
                  heading = Config.PowerPlant['locations'][k]['coords'].w,
                  debugPoly = Config.debugPoly,
                  minZ = Config.PowerPlant['locations'][k]['coords'].z-0.3,
                  maxZ = Config.PowerPlant['locations'][k]['coords'].z+1, 
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:powerplant:PlaceBomb',
                          icon = 'fas fa-bomb',
                          label = 'Place Explosive',
                          job = {'all'},
                      }
                  },
                  distance = 1.5,

              })
          elseif Config.TargetOption == 'qb' then
              exports['qb-target']:AddBoxZone('placeExplosive'..math.random(1,100), vector3(Config.PowerPlant['locations'][k]['coords'].x, Config.PowerPlant['locations'][k]['coords'].y, Config.PowerPlant['locations'][k]['coords'].z), 0.6, 1.5, {
                  name = 'placeExplosive'..math.random(1,100), 
                  heading = Config.PowerPlant['locations'][k]['coords'].w,
                  debugPoly = Config.debugPoly,
                  minZ = Config.PowerPlant['locations'][k]['coords'].z-0.3,
                  maxZ = Config.PowerPlant['locations'][k]['coords'].z+1, 
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:powerplant:PlaceBomb',
                          icon = 'fas fa-bomb',
                          label = 'Place Explosive',
                          job = all,
                      }
                  },
                  distance = 1.5,

              })
          elseif Config.TargetOption == 'berkie' then
              exports['berkie-target']:AddBoxZone('placeExplosive'..math.random(1,100), vector3(Config.PowerPlant['locations'][k]['coords'].x, Config.PowerPlant['locations'][k]['coords'].y, Config.PowerPlant['locations'][k]['coords'].z), 0.6, 1.5, {
                  name = 'placeExplosive'..math.random(1,100), 
                  heading = Config.PowerPlant['locations'][k]['coords'].w,
                  debugPoly = Config.debugPoly,
                  minZ = Config.PowerPlant['locations'][k]['coords'].z-0.3,
                  maxZ = Config.PowerPlant['locations'][k]['coords'].z+1, 
              }, {
                  options = {
                      {
                          type = 'client',
                          event = 'qb-bankrobbery:powerplant:PlaceBomb',
                          icon = 'fas fa-bomb',
                          label = 'Place Explosive',
                          job = all,
                      }
                  },
                  distance = 1.7,

              })
            end
        end
    end
end)

-- Buy Laptops and shit
CreateThread(function() 
    if Config.EnableTrades then 
        if Config.TargetOption == 'bt' then
            -- Hunter
            exports['bt-target']:AddBoxZone('LaptopLocataion1', vector3(Config.LaptopLocations['Hunter']['coords'].x, Config.LaptopLocations['Hunter']['coords'].y, Config.LaptopLocations['Hunter']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion1', 
                heading = Config.LaptopLocations['Hunter']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Hunter']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Hunter']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Hunter',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Hunter',
                        job = {'all'},
                    }
                },
                distance = 1.5,

            })
            exports['bt-target']:AddBoxZone('LaptopLocataion2', vector3(Config.LaptopLocations['Fernando']['coords'].x, Config.LaptopLocations['Fernando']['coords'].y, Config.LaptopLocations['Fernando']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion2', 
                heading = Config.LaptopLocations['Fernando']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Fernando']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Fernando']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Fernando',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Fernando',
                        job = {'all'},
                    }
                },
                distance = 1.5,

            })
            exports['bt-target']:AddBoxZone('LaptopLocataion3', vector3(Config.LaptopLocations['Rico']['coords'].x, Config.LaptopLocations['Rico']['coords'].y, Config.LaptopLocations['Rico']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion3', 
                heading = Config.LaptopLocations['Rico']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Rico']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Rico']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Rico',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Rico',
                        job = {'all'},
                    }
                },
                distance = 1.5,

            })
            exports['bt-target']:AddBoxZone('LaptopLocataion4', vector3(Config.LaptopLocations['Gustavo']['coords'].x, Config.LaptopLocations['Gustavo']['coords'].y, Config.LaptopLocations['Gustavo']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion4', 
                heading = Config.LaptopLocations['Gustavo']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Gustavo']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Gustavo']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Gustavo',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Gustavo',
                        job = {'all'},
                    }
                },
                distance = 1.5,
            })
        elseif Config.TargetOption == 'qb' then
            exports['qb-target']:AddBoxZone('LaptopLocataion1', vector3(Config.LaptopLocations['Hunter']['coords'].x, Config.LaptopLocations['Hunter']['coords'].y, Config.LaptopLocations['Hunter']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion1', 
                heading = Config.LaptopLocations['Hunter']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Hunter']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Hunter']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Hunter',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Hunter',
                    }
                },
                distance = 1.5,

            })
            exports['qb-target']:AddBoxZone('LaptopLocataion2', vector3(Config.LaptopLocations['Fernando']['coords'].x, Config.LaptopLocations['Fernando']['coords'].y, Config.LaptopLocations['Fernando']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion2', 
                heading = Config.LaptopLocations['Fernando']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Fernando']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Fernando']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Fernando',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Fernando',
                    }
                },
                distance = 1.5,

            })
            exports['qb-target']:AddBoxZone('LaptopLocataion3', vector3(Config.LaptopLocations['Rico']['coords'].x, Config.LaptopLocations['Rico']['coords'].y, Config.LaptopLocations['Rico']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion3', 
                heading = Config.LaptopLocations['Rico']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Rico']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Rico']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Rico',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Rico',
                    }
                },
                distance = 1.5,

            })
            exports['qb-target']:AddBoxZone('LaptopLocataion4', vector3(Config.LaptopLocations['Gustavo']['coords'].x, Config.LaptopLocations['Gustavo']['coords'].y, Config.LaptopLocations['Gustavo']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion4', 
                heading = Config.LaptopLocations['Gustavo']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Gustavo']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Gustavo']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Gustavo',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Gustavo',
                    }
                },
                distance = 1.5,
            })
            exports['qb-target']:AddBoxZone('LaptopLocataion5', vector3(Config.LaptopLocations['Fisher']['coords'].x, Config.LaptopLocations['Fisher']['coords'].y, Config.LaptopLocations['Fisher']['coords'].z), 1.5, 1.5, {
              name = 'LaptopLocataion5', 
              heading = Config.LaptopLocations['Fisher']['coords'].w,
              debugPoly = Config.debugPoly,
              minZ = Config.LaptopLocations['Fisher']['coords'].z-0.3,
              maxZ = Config.LaptopLocations['Fisher']['coords'].z+1, 
          }, {
              options = {
                  {
                      type = 'client',
                      event = 'qb-bankrobbery:PedTrading:Fisher',
                      icon = 'fas fa-cookie',
                      label = 'Talk to Fisher',
                  }
              },
              distance = 1.5,
          })
        elseif Config.TargetOption == 'berkie' then
            exports['berkie-target']:AddBoxZone('LaptopLocataion1', vector3(Config.LaptopLocations['Hunter']['coords'].x, Config.LaptopLocations['Hunter']['coords'].y, Config.LaptopLocations['Hunter']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion1', 
                heading = Config.LaptopLocations['Hunter']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Hunter']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Hunter']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Hunter',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Hunter',
                    }
                },
                distance = 1.5,

            })
            exports['berkie-target']:AddBoxZone('LaptopLocataion2', vector3(Config.LaptopLocations['Fernando']['coords'].x, Config.LaptopLocations['Fernando']['coords'].y, Config.LaptopLocations['Fernando']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion2', 
                heading = Config.LaptopLocations['Fernando']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Fernando']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Fernando']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Fernando',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Fernando',
                    }
                },
                distance = 1.5,

            })
            exports['berkie-target']:AddBoxZone('LaptopLocataion3', vector3(Config.LaptopLocations['Rico']['coords'].x, Config.LaptopLocations['Rico']['coords'].y, Config.LaptopLocations['Rico']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion3', 
                heading = Config.LaptopLocations['Rico']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Rico']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Rico']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Rico',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Rico',
                    }
                },
                distance = 1.5,

            })
            exports['berkie-target']:AddBoxZone('LaptopLocataion4', vector3(Config.LaptopLocations['Gustavo']['coords'].x, Config.LaptopLocations['Gustavo']['coords'].y, Config.LaptopLocations['Gustavo']['coords'].z), 1.5, 1.5, {
                name = 'LaptopLocataion4', 
                heading = Config.LaptopLocations['Gustavo']['coords'].w,
                debugPoly = Config.debugPoly,
                minZ = Config.LaptopLocations['Gustavo']['coords'].z-0.3,
                maxZ = Config.LaptopLocations['Gustavo']['coords'].z+1, 
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-bankrobbery:PedTrading:Gustavo',
                        icon = 'fas fa-cookie',
                        label = 'Talk to Gustavo',
                    }
                },
                distance = 1.5,
            })
        end
    end
end)

--  Trays Paleto 2nd vault
CreateThread(function() 
    for k,v in pairs(Config.PaletoSecond ['trollys']) do
          if Config.TargetOption == 'bt' then 
              exports['bt-target']:AddBoxZone('LootTray'..math.random(1,100), vector3(Config.PaletoSecond ['trollys'][k]['coords'].x, Config.PaletoSecond ['trollys'][k]['coords'].y, Config.PaletoSecond ['trollys'][k]['coords'].z), 0.8, 1.0, {
                  name = 'LootTray'..math.random(1,100), 
                  heading = Config.PaletoSecond ['trollys'][k]['heading'],
                  debugPoly = Config.debugPoly,
                  minZ = Config.PaletoSecond ['trollys'][k]['coords'].z-1,
                  maxZ = Config.PaletoSecond ['trollys'][k]['coords'].z+1,
                  }, {
                  options = { 
                    { 
                      type = 'client',
                      event = 'qb-bankrobbery:client:PaletoSecond',
                      icon = 'fas fa-hand-paper',
                      label = 'Grab Loot',
                      job = {'all'},
                    }
                  },
                  distance = 2.0,
              })
          elseif Config.TargetOption == 'qb' then
              exports['qb-target']:AddBoxZone('LootTray'..math.random(1,100), vector3(Config.PaletoSecond ['trollys'][k]['coords'].x, Config.PaletoSecond ['trollys'][k]['coords'].y, Config.PaletoSecond ['trollys'][k]['coords'].z), 0.8, 1.0, {
                  name = 'LootTray'..math.random(1,100), 
                  heading = Config.PaletoSecond ['trollys'][k]['heading'],
                  debugPoly = Config.debugPoly, 
                  minZ = Config.PaletoSecond ['trollys'][k]['coords'].z-1,
                  maxZ = Config.PaletoSecond ['trollys'][k]['coords'].z+1,
                  }, {
                  options = { 
                    { 
                      type = 'client',
                      event = 'qb-bankrobbery:client:PaletoSecond',
                      icon = 'fas fa-hand-paper',
                      label = 'Grab Loot',
                      job = all,
                    }
                  },
                  distance = 2.0,
            })
          elseif Config.TargetOption == 'berkie' then
            exports['berkie-target']:AddBoxZone('LootTray'..math.random(1,100), vector3(Config.PaletoSecond ['trollys'][k]['coords'].x, Config.PaletoSecond ['trollys'][k]['coords'].y, Config.PaletoSecond ['trollys'][k]['coords'].z), 0.8, 1.0, {
                name = 'LootTray'..math.random(1,100), 
                heading = Config.PaletoSecond ['trollys'][k]['heading'],
                debugPoly = Config.debugPoly,
                minZ = Config.PaletoSecond ['trollys'][k]['coords'].z-1,
                maxZ = Config.PaletoSecond ['trollys'][k]['coords'].z+1,
                }, {
                options = { 
                  { 
                    type = 'client',
                    event = 'qb-bankrobbery:client:PaletoSecond',
                    icon = 'fas fa-hand-paper',
                    label = 'Grab Loot',
                    job = all,
                  }
                },
                distance = 2.0,
          })
          end
        end
  end)
  
  -- Drills Paleto 2nd vault
  CreateThread(function() 
    for k,v in pairs(Config.PaletoSecond ['drills']) do
          if Config.TargetOption == 'bt' then 
              exports['bt-target']:AddBoxZone('PaletoDrill'..math.random(1,100), vector3(Config.PaletoSecond ['drills'][k]['coords'].x, Config.PaletoSecond ['drills'][k]['coords'].y, Config.PaletoSecond ['drills'][k]['coords'].z), 1.0, 0.8, { 
                  name = 'PaletoDrill'..math.random(1,100), 
                  heading = Config.PaletoSecond ['drills'][k]['rotation'].z,
                  debugPoly = Config.debugPoly,
                  minZ = Config.PaletoSecond ['drills'][k]['coords'].z-1,
                  maxZ = Config.PaletoSecond ['drills'][k]['coords'].z+1,
                  }, {
                  options = { 
                    { 
                      type = 'client',
                      event = 'qb-bankrobbery:Paleto2ndDrill',
                      icon = 'fas fa-cookie',
                      label = 'Drill Saftey Box',
                      job = {'all'},
                    }
                  },
                  distance = 1.3,
              })
          elseif Config.TargetOption == 'qb' then
              exports['qb-target']:AddBoxZone('PaletoDrill'..math.random(1,100), vector3(Config.PaletoSecond ['drills'][k]['coords'].x, Config.PaletoSecond ['drills'][k]['coords'].y, Config.PaletoSecond ['drills'][k]['coords'].z), 1.0, 0.8, { 
                  name = 'PaletoDrill'..math.random(1,100), 
                  heading = Config.PaletoSecond ['drills'][k]['rotation'].z,
                  debugPoly = Config.debugPoly,
                  minZ = Config.PaletoSecond ['drills'][k]['coords'].z-1,
                  maxZ = Config.PaletoSecond ['drills'][k]['coords'].z+1,
                  }, {
                  options = { 
                    { 
                      type = 'client',
                      event = 'qb-bankrobbery:Paleto2ndDrill',
                      icon = 'fas fa-cookie',
                      label = 'Drill Saftey Box',
                      job = all,
                    }
                  },
                  distance = 1.3,
            })
          elseif Config.TargetOption == 'berkie' then
            exports['berkie-target']:AddBoxZone('PaletoDrill'..math.random(1,100), vector3(Config.PaletoSecond ['drills'][k]['coords'].x, Config.PaletoSecond ['drills'][k]['coords'].y, Config.PaletoSecond ['drills'][k]['coords'].z), 1.0, 0.8, { 
              name = 'PaletoDrill'..math.random(1,100), 
                heading = Config.PaletoSecond ['drills'][k]['rotation'].z,
                debugPoly = Config.debugPoly,
                minZ = Config.PaletoSecond ['drills'][k]['coords'].z-1,
                maxZ = Config.PaletoSecond ['drills'][k]['coords'].z+1,
                }, {
                options = { 
                  { 
                    type = 'client',
                    event = 'qb-bankrobbery:Paleto2ndDrill',
                    icon = 'fas fa-cookie',
                    label = 'Drill Saftey Box',
                    job = all,
                  }
                },
                distance = 1.3,
          })
          end
      end
  end)
  
  -- Thermite Doors Paleto 2nd vault
  CreateThread(function() 
    for k,v in pairs(Config.PaletoSecond ['thermite']) do
      if Config.TargetOption == 'bt' then 
        exports['bt-target']:AddBoxZone('LootTray'..math.random(1,100), vector3(Config.PaletoSecond ['thermite'][k]['coords'].x, Config.PaletoSecond ['thermite'][k]['coords'].y, Config.PaletoSecond ['thermite'][k]['coords'].z), 0.6, 1.2, {
            name = 'LootTray'..math.random(1,100), 
            heading = Config.PaletoSecond ['thermite'][k]['coords'].w,
            debugPoly = Config.debugPoly,
            minZ = Config.PaletoSecond ['thermite'][k]['coords'].z-1,
            maxZ = Config.PaletoSecond ['thermite'][k]['coords'].z+1,
            }, {
            options = { 
              { 
                type = 'client',
                event = 'qb-bankrobbery:paleto:thermitedoor',
                icon = 'fas fa-bomb',
                label = 'Open Door',
                job = {'all'},
              }
            },
            distance = 1.2,
        })
      elseif Config.TargetOption == 'qb' then
        exports['qb-target']:AddBoxZone('OpenDoor'..math.random(1,100), vector3(Config.PaletoSecond ['thermite'][k]['coords'].x, Config.PaletoSecond ['thermite'][k]['coords'].y, Config.PaletoSecond ['thermite'][k]['coords'].z), 0.6, 1.2, {
            name = 'OpenDoor'..math.random(1,100), 
            heading = Config.PaletoSecond ['thermite'][k]['coords'].w,
            debugPoly = Config.debugPoly, 
            minZ = Config.PaletoSecond ['thermite'][k]['coords'].z-1,
            maxZ = Config.PaletoSecond ['thermite'][k]['coords'].z+1,
            }, {
            options = { 
              { 
                type = 'client',
                event = 'qb-bankrobbery:paleto:thermitedoor',
                icon = 'fas fa-bomb',
                label = 'Open Door',
                job = all,
              }
            },
            distance = 1.2,
      })
      elseif Config.TargetOption == 'berkie' then
        exports['berkie-target']:AddBoxZone('OpenDoor'..math.random(1,100), vector3(Config.PaletoSecond ['thermite'][k]['coords'].x, Config.PaletoSecond ['thermite'][k]['coords'].y, Config.PaletoSecond ['thermite'][k]['coords'].z), 0.6, 1.2, {
          name = 'OpenDoor'..math.random(1,100), 
          heading = Config.PaletoSecond ['thermite'][k]['coords'].w,
          debugPoly = Config.debugPoly,
          minZ = Config.PaletoSecond ['thermite'][k]['coords'].z-1,
          maxZ = Config.PaletoSecond ['thermite'][k]['coords'].z+1,
          }, {
          options = { 
            { 
              type = 'client',
              event = 'qb-bankrobbery:paleto:thermitedoor',
              icon = 'fas fa-bomb',
              label = 'Open Door',
              job = all,
            }
          },
          distance = 1.2,
        })
      end
    end
  
    exports['qb-target']:AddBoxZone('Paleto2ndPCHAck', vector3(-97.833, 6466.48, 31.63), 1, 1.5, {
      name = 'Paleto2ndPCHAck', 
      heading = 134,
      debugPoly = Config.debugPoly, 
      minZ = 31.63-1,
      maxZ = 31.63+1,
      }, {
      options = { 
        { 
          type = 'client',
          event = 'qb-bankrobbery:PaletoHackIntiate',
          icon = 'fas fa-laptop',
          label = 'Hack Computer',
          job = all,
        }
      },
      distance = 1.2,
    })
end)

-- Handler for Ped Trading
RegisterNetEvent('qb-bankrobbery:PedTrading:Hunter', function()
    local ped = PlayerPedId()
    TriggerEvent('animations:client:EmoteCommandStart', {'argue2'})
    QBCore.Functions.Progressbar('qb-bankrobbery:Trade1', 'Hunter is looking at your stuff...', 4500, false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(ped)
        TriggerServerEvent('qb-bankrobbery:server:BuyLaptop', 'Hunter')
    end)
end)

RegisterNetEvent('qb-bankrobbery:PedTrading:Fernando', function()
    local ped = PlayerPedId()
    TriggerEvent('animations:client:EmoteCommandStart', {'argue2'})
    QBCore.Functions.Progressbar('qb-bankrobbery:Trade1', 'Fernando is looking at your stuff...', 4500, false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(ped)
        TriggerServerEvent('qb-bankrobbery:server:BuyLaptop', 'Fernando')
    end)
end)

RegisterNetEvent('qb-bankrobbery:PedTrading:Rico', function()
    local ped = PlayerPedId()
    TriggerEvent('animations:client:EmoteCommandStart', {'argue2'})
    QBCore.Functions.Progressbar('qb-bankrobbery:Trade1', 'Rico is looking at your stuff...', 4500, false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(ped)
        TriggerServerEvent('qb-bankrobbery:server:BuyLaptop', 'Rico')
    end)
end)

RegisterNetEvent('qb-bankrobbery:PedTrading:Gustavo', function()
    local ped = PlayerPedId()
    TriggerEvent('animations:client:EmoteCommandStart', {'argue2'})
    QBCore.Functions.Progressbar('qb-bankrobbery:Trade1', 'Gustavo is looking at your stuff...', 4500, false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(ped)
        TriggerServerEvent('qb-bankrobbery:server:BuyLaptop', 'Gustavo')
    end)
end)

RegisterNetEvent('qb-bankrobbery:PedTrading:Fisher', function()
  local ped = PlayerPedId()
  TriggerEvent('animations:client:EmoteCommandStart', {'argue2'})
  QBCore.Functions.Progressbar('qb-bankrobbery:Trade1', 'Fisher is looking at your stuff...', 4500, false, false, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true,
  }, {}, {}, {}, function()
      ClearPedTasks(ped)
      TriggerServerEvent('qb-bankrobbery:server:BuyLaptop', 'Fisher')
  end)
end)