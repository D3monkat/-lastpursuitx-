local upnseat, sitting, Chairs, chairlist = nil, false, {}, {}

if Config.Locations[1].zoneEnable then
	if Config.Locations[1].MLO == "GN" then
		--Counter Stools
		chairlist[#chairlist+1] = { coords = vec4(90.14, 274.38, 110.45, 340.33), stand = vec3(89.7, 273.13, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(89.22, 274.55, 110.45, 340.48), stand = vec3(88.84, 273.77, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(88.36, 275.00, 110.45, 340.29), stand = vec3(88.07, 273.96, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(87.42, 275.24, 110.45, 340.90), stand = vec3(87.16, 274.19, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(86.63, 275.57, 110.45, 340.71), stand = vec3(86.29, 274.61, 110.21) }
		--Small Table 1
		chairlist[#chairlist+1] = { coords = vec4(82.80, 279.32, 110.20, 340.42), stand = vec3(82.15, 279.36, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(83.13, 280.40, 110.20, 160.30), stand = vec3(82.6, 280.83, 110.22) }
		--Small Table 2
		chairlist[#chairlist+1] = { coords = vec4(83.58, 281.45, 110.20, 340.07), stand = vec3(82.89, 281.4, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(83.89, 282.56, 110.20, 160.83), stand = vec3(83.77, 283.17, 110.22) }
		--Booth1
		chairlist[#chairlist+1] = { coords = vec4(79.21, 278.72, 110.20, 340.55), stand = vec3(81.13, 278.67, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(80.13, 278.39, 110.20, 340.57), stand = vec3(81.13, 278.67, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(79.76, 280.12, 110.20, 160.62), stand = vec3(81.13, 278.67, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(80.59, 279.84, 110.20, 160.36), stand = vec3(81.13, 278.67, 110.22) }
		--Booth2
		chairlist[#chairlist+1] = { coords = vec4(80.16, 281.09, 110.20, 340.99), stand = vec3(81.89, 281.11, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(80.98, 280.80, 110.20, 340.94), stand = vec3(81.89, 281.11, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(80.53, 282.59, 110.20, 160.57), stand = vec3(81.89, 281.11, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(81.43, 282.26, 110.20, 160.76), stand = vec3(81.89, 281.11, 110.22) }
		--Booth3
		chairlist[#chairlist+1] = { coords = vec4(81.15, 283.46, 110.20, 340.44), stand = vec3(82.97, 283.73, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(81.88, 283.19, 110.20, 340.44), stand = vec3(82.97, 283.73, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(81.55, 284.92, 110.20, 160.49), stand = vec3(82.97, 283.73, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(82.33, 284.66, 110.20, 160.48), stand = vec3(82.97, 283.73, 110.22) }
		--Booth4
		chairlist[#chairlist+1] = { coords = vec4(78.36, 279.02, 110.20, 340.88), stand = vec3(76.92, 280.16, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(77.61, 279.29, 110.20, 340.31), stand = vec3(76.92, 280.16, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(78.83, 280.47, 110.20, 160.52), stand = vec3(76.92, 280.16, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(78.04, 280.77, 110.20, 160.31), stand = vec3(76.92, 280.16, 110.22) }
		--Booth5
		chairlist[#chairlist+1] = { coords = vec4(79.25, 281.45, 110.20, 340.82), stand = vec3(77.71, 282.95, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(78.49, 281.70, 110.20, 340.50), stand = vec3(77.71, 282.95, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(79.71, 282.85, 110.20, 160.32), stand = vec3(77.71, 282.95, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(79.02, 283.14, 110.20, 160.50), stand = vec3(77.71, 282.95, 110.22) }
		--Booth5
		chairlist[#chairlist+1] = { coords = vec4(80.16, 283.82, 110.20, 340.08), stand = vec3(78.81, 285.09, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(79.32, 284.16, 110.20, 340.20), stand = vec3(78.81, 285.09, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(80.66, 285.26, 110.20, 160.45), stand = vec3(78.81, 285.09, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(79.89, 285.54, 110.20, 160.86), stand = vec3(78.81, 285.09, 110.22) }
		--Small Table 3
		chairlist[#chairlist+1] = { coords = vec4(73.63, 278.67, 110.20, 340.60), stand = vec3(74.47, 279.18, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(74.70, 278.20, 110.20, 160.74), stand = vec3(74.47, 279.18, 110.21) }
		--Medium Table 1
		chairlist[#chairlist+1] = { coords = vec4(74.21, 280.23, 110.20, 340.51), stand = vec3(75.75, 280.12, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(74.81, 280.01, 110.20, 340.83), stand = vec3(75.75, 280.12, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(74.74, 281.79, 110.20, 160.81), stand = vec3(75.75, 280.12, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(75.26, 281.1, 110.20, 160.95), stand = vec3(75.75, 280.12, 110.22) }
		--Medium Table 2
		chairlist[#chairlist+1] = { coords = vec4(75.22, 283.02, 110.20, 340.98), stand = vec3(76.93, 282.86, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(75.95, 282.76, 110.20, 340.64), stand = vec3(76.93, 282.86, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(75.66, 284.34, 110.20, 160.11), stand = vec3(76.93, 282.86, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(76.49, 284.04, 110.20, 160.29), stand = vec3(76.93, 282.86, 110.22) }
		--Managers Office
		chairlist[#chairlist+1] = { coords = vec4(95.19, 292.66, 110.20, 80.93), stand = vec3(95.41, 293.1, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(93.28, 292.85, 110.20, 340.75), stand = vec3(92.84, 293.76, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(93.72, 294.02, 110.20, 340.43), stand = vec3(92.84, 293.76, 110.22) }
		--Staff Room
		chairlist[#chairlist+1] = { coords = vec4(86.81, 298.36, 110.20, 178.76) }
		chairlist[#chairlist+1] = { coords = vec4(84.94, 294.02, 110.20, 340.13), stand = vec3(85.7, 293.66, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(84.36, 295.14, 110.20, 227.19), stand = vec3(84.49, 295.9, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(85.55, 295.52, 110.20, 147.88), stand = vec3(86.42, 295.46, 110.22) }
		chairlist[#chairlist+1] = { coords = vec4(86.06, 294.39, 110.20, 52.86), stand = vec3(86.42, 295.46, 110.22) }
	elseif Config.Locations[1].MLO == "GABZ" then
		chairlist[#chairlist+1] = { coords = vec4(81.58, 292.11, 110.21, 250.0), stand = vector3(81.27, 291.38, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(81.82, 292.78, 110.21, 250.0), stand = vector3(81.27, 291.38, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(83.17, 292.33, 110.21, 70.0), stand = vector3(82.63, 290.97, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(82.92, 291.63, 110.21, 70.0), stand = vector3(82.63, 290.97, 110.21) }

		chairlist[#chairlist+1] = { coords = vec4(83.79, 292.11, 110.21, 250.0), stand = vector3(83.22, 290.79, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(83.54, 291.4, 110.21, 250.0), stand = vector3(83.22, 290.79, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(85.13, 291.61, 110.21, 70.0), stand = vector3(84.59, 290.33, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(84.88, 290.92, 110.21, 70.0), stand = vector3(84.59, 290.33, 110.21) }

		chairlist[#chairlist+1] = { coords = vec4(85.76, 291.37, 110.21, 250.0), stand = vector3(85.21, 290.03, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(85.5, 290.71, 110.21, 250.0), stand = vector3(85.21, 290.03, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(87.1, 290.9, 110.21, 70.0), stand = vector3(86.61, 289.59, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(86.84, 290.21, 110.21, 70.0), stand = vector3(86.61, 289.59, 110.21) }

		chairlist[#chairlist+1] = { coords = vec4(83.04, 285.47, 110.21, 205.0), stand = vector3(82.21, 285.19, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(83.71, 285.78, 110.21, 205.0), stand = vector3(82.21, 285.19, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(84.35, 284.43, 110.21, 25.0), stand = vector3(83.0, 283.87, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(83.67, 284.11, 110.21, 25.0), stand = vector3(83.0, 283.87, 110.21) }

		chairlist[#chairlist+1] = { coords = vec4(83.95, 283.51, 110.21, 205.0), stand = vector3(83.39, 283.17, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(84.64, 283.83, 110.21, 205.0), stand = vector3(83.39, 283.17, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(84.58, 282.14, 110.21, 25.0), stand = vector3(83.83, 281.87, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(85.26, 282.46, 110.21, 25.0), stand = vector3(83.83, 281.87, 110.21) }


		chairlist[#chairlist+1] = { coords = vec4(87.26, 283.29, 110.21, 25.0), stand = vector3(87.78, 283.59, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(86.37, 283.64, 110.21, 295.0), stand = vector3(87.78, 283.59, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(86.03, 284.39, 110.21, 295.0) }
		chairlist[#chairlist+1] = { coords = vec4(85.68, 285.13, 110.21, 295.0) }

		chairlist[#chairlist+1] = { coords = vec4(85.33, 285.86, 110.21, 295.0), stand = vector3(86.22, 286.98, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(85.61, 286.82, 110.21, 205.0), stand = vector3(86.22, 286.98, 110.21) }

		chairlist[#chairlist+1] = { coords = vec4(87.38, 279.05, 110.21, 205.0), stand = vector3(88.15, 279.45, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(86.69, 278.72, 110.21, 205.0), stand = vector3(85.94, 278.45, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(88.01, 277.67, 110.21, 25.0), stand = vector3(88.8, 277.98, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(87.34, 277.36, 110.21, 25.0), stand = vector3(86.66, 276.87, 110.21) }

		chairlist[#chairlist+1] = { coords = vec4(91.35, 278.05, 110.21, 160.0), stand = vector3(89.95, 278.67, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(90.65, 278.31, 110.21, 160.0), stand = vector3(89.95, 278.67, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(90.86, 276.71, 110.21, 340.0), stand = vector3(89.65, 277.24, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(90.18, 276.96, 110.21, 340.0), stand = vector3(89.65, 277.24, 110.21) }

		chairlist[#chairlist+1] = { coords = vec4(90.63, 276.09, 110.21, 160.0), stand = vector3(89.39, 276.59, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(89.95, 276.34, 110.21, 160.0), stand = vector3(89.39, 276.59, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(90.16, 274.74, 110.21, 340.0), stand = vector3(88.72, 275.18, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(89.45, 275.00, 110.21, 340.0), stand = vector3(88.72, 275.18, 110.21) }

		chairlist[#chairlist+1] = { coords = vec4(88.07, 273.77, 110.21, 70.0), stand = vector3(88.72, 275.18, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(88.33, 274.5, 110.21, 70.0), stand = vector3(88.72, 275.18, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(86.73, 274.28, 110.21, 250.0), stand = vector3(87.23, 275.49, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(86.99, 274.97, 110.21, 250.0), stand = vector3(87.23, 275.49, 110.21) }

		chairlist[#chairlist+1] = { coords = vec4(86.11, 274.5, 110.21, 70.0), stand = vector3(86.61, 275.81, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(86.36, 275.2, 110.21, 70.0), stand = vector3(86.61, 275.81, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(84.75, 274.93, 110.21, 250.0), stand = vector3(85.32, 276.22, 110.21) }
		chairlist[#chairlist+1] = { coords = vec4(85.0, 275.66, 110.21, 250.0), stand = vector3(85.32, 276.22, 110.21) }
	end
end
if Config.Locations[2].zoneEnable then
	if Config.Locations[2].MLO == "GABZ" then
		chairlist[#chairlist+1] = { coords = vec4(1251.32, -363.62, 69.08, 165.0), stand = vector3(1249.66, -363.2, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1250.48, -363.39, 69.08, 165.0), stand = vector3(1249.66, -363.2, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1250.83, -365.48, 69.08, 345.0), stand = vector3(1249.2, -364.9, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1250.05, -365.28, 69.08, 345.0), stand = vector3(1249.2, -364.9, 69.08) }

		chairlist[#chairlist+1] = { coords = vec4(1250.64, -366.19, 69.08, 165.0), stand = vector3(1248.98, -365.8, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1249.87, -365.99, 69.08, 165.0), stand = vector3(1248.98, -365.8, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1250.16, -368.04, 69.08, 345.0), stand = vector3(1248.49, -367.54, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1249.26, -367.79, 69.08, 345.0), stand = vector3(1248.49, -367.54, 69.08) }

		chairlist[#chairlist+1] = { coords = vec4(1245.59, -362.07, 69.08, 165.0), stand = vector3(1247.2, -362.55, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1246.44, -362.31, 69.08, 165.0), stand = vector3(1247.2, -362.55, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1245.13, -363.95, 69.08, 345.0), stand = vector3(1246.74, -364.35, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1245.96, -364.17, 69.08, 345.0), stand = vector3(1246.74, -364.35, 69.08) }

		chairlist[#chairlist+1] = { coords = vec4(1244.91, -364.66, 69.08, 165.0), stand = vector3(1246.48, -365.22, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1245.73, -364.87, 69.08, 165.0), stand = vector3(1246.48, -365.22, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1244.41, -366.5, 69.08, 345.0), stand = vector3(1246.0, -367.01, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1245.21, -366.72, 69.08, 345.0), stand = vector3(1246.0, -367.01, 69.08) }

		chairlist[#chairlist+1] = { coords = vec4(1240.45, -360.71, 69.08, 165.0), stand = vector3(1238.8, -360.41, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1239.72, -360.52, 69.08, 165.0), stand = vector3(1238.8, -360.41, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1239.96, -362.57, 69.08, 345.0), stand = vector3(1238.42, -362.07, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1239.23, -362.38, 69.08, 345.0), stand = vector3(1238.42, -362.07, 69.08) }

		chairlist[#chairlist+1] = { coords = vec4(1239.79, -363.28, 69.08, 165.0), stand = vector3(1238.17, -363.0, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1238.98, -363.06, 69.08, 165.0), stand = vector3(1238.17, -363.0, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1239.27, -365.12, 69.08, 345.0), stand = vector3(1237.76, -364.47, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1238.53, -364.93, 69.08, 345.0), stand = vector3(1237.76, -364.47, 69.08) }

		chairlist[#chairlist+1] = { coords = vec4(1236.34, -363.62, 69.38, 165.0), stand = vector3(1237.76, -364.47, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1235.38, -363.4, 69.38, 165.0), stand = vector3(1235.48, -363.01, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1234.29, -363.19, 69.38, 165.0), stand = vector3(1234.47, -362.72, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1234.51, -361.88, 69.38, 75.0), stand = vector3(1234.9, -362.01, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1234.8, -360.88, 69.38, 165.0), stand = vector3(1235.29, -360.97, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1235.02, -359.81, 69.38, 75.0), stand = vector3(1235.48, -359.94, 69.08) }

		chairlist[#chairlist+1] = { coords = vec4(1237.71, -352.94, 69.08, 255.0), stand = vector3(1237.46, -354.17, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1237.53, -353.61, 69.08, 255.0), stand = vector3(1237.46, -354.17, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1238.86, -353.25, 69.08, 75.0), stand = vector3(1238.6, -354.46, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1238.69, -353.91, 69.08, 75.0), stand = vector3(1238.6, -354.46, 69.08) }

		chairlist[#chairlist+1] = { coords = vec4(1239.45, -353.37, 69.08, 255.0), stand = vector3(1239.2, -354.72, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1239.27, -354.07, 69.08, 255.0), stand = vector3(1239.2, -354.72, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1240.60, -353.69, 69.08, 75.0), stand = vector3(1240.23, -354.91, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1240.44, -354.36, 69.08, 75.0), stand = vector3(1240.23, -354.91, 69.08) }

		chairlist[#chairlist+1] = { coords = vec4(1238.5, -348.17, 69.08, 255.0), stand = vector3(1238.28, -348.96, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1240.22, -348.76, 69.08, 75.0), stand = vector3(1240.7, -348.88, 69.08) }
		chairlist[#chairlist+1] = { coords = vec4(1239.98, -349.61, 69.08, 75.0), stand = vector3(1240.49, -349.8, 69.08) }
	end
end

CreateThread(function()
	local i = 0
	for _, v in pairs(chairlist) do i += 1
		Chairs["UpNChair"..i] =
			exports['qb-target']:AddBoxZone("UpNChair"..i, vec3(v.coords.x, v.coords.y , v.coords.z-1.03), 0.6, 0.6, { name= "UpNChair"..i, heading = v.coords[4], debugPoly = Config.Debug, minZ = v.coords.z-1.2, maxZ = v.coords.z+0.2, },
				{ options = { { event = "jim-upnatomhorny:Chair", icon = "fas fa-chair", label = Loc[Config.Lan].targetinfo["sit"], loc = v.coords, stand = v.stand }, },
					distance = 2.2 })
	end
	if Config.Debug then print("^5Debug^7: ^2Created ^6"..i.." ^2Chairs^7") end
end)

RegisterNetEvent('jim-upnatomhorny:Chair', function(data)
	local canSit = true
	local sitting = false
	local ped = PlayerPedId()
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz)
		if dist <= 0.4 then TriggerEvent("QBCore:Notify", Loc[Config.Lan].error["seat_taken"]) canSit = false end
	end
	if canSit then
		if not IsPedHeadingTowardsPosition(ped, data.loc.xyz, 20.0) then TaskTurnPedToFaceCoord(ped, data.loc.xyz, 1500) Wait(1500)	end
		if #(data.loc.xyz - GetEntityCoords(PlayerPedId())) > 1.5 then TaskGoStraightToCoord(ped, data.loc.xyz, 0.5, 1000, 0.0, 0) Wait(1100) end
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.loc[4], 0, 1, true)
		upnseat = data.stand
		sitting = true
	end
	while sitting do
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				if upnseat then SetEntityCoords(ped, vec3(upnseat.x, upnseat.y, upnseat.z-0.7)) end
				upnseat = nil
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k, v in pairs(Chairs) do exports['qb-target']:RemoveZone(k) end
	end
end)