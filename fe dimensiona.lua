local REPWINGS = {}
if game.GameId == 0000 then
	local Times = 11
	local Duplicate = function()
		local PlayerFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		for i=1,Times do
			wait(0.1)
			game.Players.LocalPlayer.Character.Humanoid.Health = 0 
			game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlayerFrame
			local BackpackDescendants = game.Players.LocalPlayer.Backpack:GetDescendants()
			for i=1,#BackpackDescendants do
				if BackpackDescendants[i]:IsA("Tool") then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(BackpackDescendants[i])
					BackpackDescendants[i].Handle.Position = Vector3.new(0,0,0)

					BackpackDescendants[i].Handle.CanCollide = false
					BackpackDescendants[i].Handle.Anchored = true
					BackpackDescendants[i].Parent = workspace
					spawn(function()
						game.Players.LocalPlayer.CharacterAdded:wait()
						game.Players.LocalPlayer.Character:WaitForChild("Right Leg",1)
						BackpackDescendants[i].Handle.Anchored = false
						BackpackDescendants[i].Handle.Position = game.Players.LocalPlayer.Character["Right Leg"].Position
					end)
				end
			end
			game.Players.LocalPlayer.CharacterAdded:wait()
			wait(0.3)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlayerFrame
		end
	end

	Duplicate()
	wait(1)
	local BackpackDescendants = game.Players.LocalPlayer.Backpack:GetDescendants()
	for i=1,#BackpackDescendants do
		if BackpackDescendants[i]:IsA("Tool") then
			BackpackDescendants[i].Parent = game.Players.LocalPlayer.Character
		end
	end


	wait(1)
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") then
			table.insert(REPWINGS,(#REPWINGS)+1,v.Handle)
		end
	end

end









Bypass = "death"
if not Bypass then Bypass = "limbs" end
HumanDied = false






local HumanRoot = game.Players.LocalPlayer.Character.HumanoidRootPart

CountSCIFIMOVIELOL = 1
function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
	local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 67752;
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "AthP_"..CountSCIFIMOVIELOL
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "AthP_"..CountSCIFIMOVIELOL
	local AttachmentC=Instance.new('Attachment',Part1); AttachmentC.Name = "AthO_"..CountSCIFIMOVIELOL
	local AttachmentD=Instance.new('Attachment',Part0); AttachmentD.Name = "AthO_"..CountSCIFIMOVIELOL
	AttachmentC.Orientation = Angle
	AttachmentA.Position = Position
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentC;
	AlignOri.Attachment0 = AttachmentD;
	CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1

	s = game:GetService("RunService").Heartbeat:connect(function()
		Part0.Velocity = Vector3.new(0,50,0)
	end)
	spawn(function()
		while true do
			wait()
			if HumanDied then
				s:Disconnect()
				break
			end
		end
	end)
end

coroutine.wrap(function()
	local player = game.Players.LocalPlayer
	local char = player.Character or player.CharacterAdded:wait()
	if sethiddenproperty then
		while true do
			game:GetService("RunService").RenderStepped:Wait()
			settings().Physics.AllowSleep = false
			local TBL = game:GetService("Players"):GetChildren() 
			for _ = 1,#TBL do local Players = TBL[_]
				if Players ~= game:GetService("Players").LocalPlayer then
					Players.MaximumSimulationRadius = 0
					sethiddenproperty(Players,"SimulationRadius",0) 
				end 
			end
			game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)
			sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.pow(math.huge,math.huge)*math.huge)
			if HumanDied then break end
		end
	else
		while true do
			game:GetService("RunService").RenderStepped:Wait()
			settings().Physics.AllowSleep = false
			local TBL = game:GetService("Players"):GetChildren() 
			for _ = 1,#TBL do local Players = TBL[_]
				if Players ~= game:GetService("Players").LocalPlayer then
					Players.MaximumSimulationRadius = 0
				end 
			end
			game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)
			if HumanDied then break end
		end
	end
end)()

if game:GetService("Players").LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
	if Bypass == "limbs" then --------------------------------------------------------------------------------------------------------------------
		game:GetService("Players").LocalPlayer["Character"].Archivable = true 
		local CloneChar = game:GetService("Players").LocalPlayer["Character"]:Clone()
		CloneChar.Parent = workspace 
		CloneChar.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame * CFrame.new(0,2,0)
		wait() 
		CloneChar.Humanoid.BreakJointsOnDeath = false
		workspace.Camera.CameraSubject = CloneChar.Humanoid
		CloneChar.Name = "non" 
		CloneChar.Humanoid.DisplayDistanceType = "None"
		if CloneChar.Head:FindFirstChild("face") then CloneChar.Head:FindFirstChild("face"):Destroy() end
		if workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face") then workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face").Parent = CloneChar.Head end

		local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]
		DeadChar.HumanoidRootPart:Destroy()

		local LVecPart = Instance.new("Part", workspace) LVecPart.CanCollide = false LVecPart.Transparency = 1
		local CONVEC
		local function VECTORUNIT()
			if HumanDied then CONVEC:Disconnect(); return end
			local lookVec = workspace.Camera.CFrame.lookVector
			local Root = CloneChar["HumanoidRootPart"]
			LVecPart.Position = Root.Position
			LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
		end
		CONVEC = game:GetService("RunService").Heartbeat:Connect(VECTORUNIT)

		local CONDOWN
		local WDown, ADown, SDown, DDown, SpaceDown = false, false, false, false, false
		local function KEYDOWN(_,Processed) 
			if HumanDied then CONDOWN:Disconnect(); return end
			if Processed ~= true then
				local Key = _.KeyCode
				if Key == Enum.KeyCode.W then
					WDown = true end
				if Key == Enum.KeyCode.A then
					ADown = true end
				if Key == Enum.KeyCode.S then
					SDown = true end
				if Key == Enum.KeyCode.D then
					DDown = true end
				if Key == Enum.KeyCode.Space then
					SpaceDown = true end end end
		CONDOWN = game:GetService("UserInputService").InputBegan:Connect(KEYDOWN)

		local CONUP
		local function KEYUP(_)
			if HumanDied then CONUP:Disconnect(); return end
			local Key = _.KeyCode
			if Key == Enum.KeyCode.W then
				WDown = false end
			if Key == Enum.KeyCode.A then
				ADown = false end
			if Key == Enum.KeyCode.S then
				SDown = false end
			if Key == Enum.KeyCode.D then
				DDown = false end
			if Key == Enum.KeyCode.Space then
				SpaceDown = false end end
		CONUP = game:GetService("UserInputService").InputEnded:Connect(KEYUP)

		local function MoveClone(X,Y,Z)
			LVecPart.CFrame = LVecPart.CFrame * CFrame.new(-X,Y,-Z)
			workspace["non"].Humanoid.WalkToPoint = LVecPart.Position
		end

		coroutine.wrap(function() 
			while true do game:GetService("RunService").RenderStepped:Wait()
				if HumanDied then break end
				if WDown then MoveClone(0,0,1e4) end
				if ADown then MoveClone(1e4,0,0) end
				if SDown then MoveClone(0,0,-1e4) end
				if DDown then MoveClone(-1e4,0,0) end
				if SpaceDown then CloneChar["Humanoid"].Jump = true end
				if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
					workspace["non"].Humanoid.WalkToPoint = workspace["non"].HumanoidRootPart.Position end
			end 
		end)()

		local con
		function UnCollide()
			if HumanDied then con:Disconnect(); return end
			for _,Parts in next, CloneChar:GetDescendants() do
				if Parts:IsA("BasePart") then
					Parts.CanCollide = false 
				end 
			end
			for _,Parts in next, DeadChar:GetDescendants() do
				if Parts:IsA("BasePart") then
					Parts.CanCollide = false
				end 
			end 
		end
		con = game:GetService("RunService").Stepped:Connect(UnCollide)

		local resetBindable = Instance.new("BindableEvent")
		resetBindable.Event:connect(function()
			game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
			resetBindable:Destroy()
			pcall(function()
				CloneChar.Humanoid.Health = 0
				DeadChar.Humanoid.Health = 0
			end)
		end)
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChild("Humanoid") or CloneChar:FindFirstChild("Humanoid").Health <= 0 or not DeadChar or not DeadChar:FindFirstChild("Head") or not DeadChar:FindFirstChild("Humanoid") or DeadChar:FindFirstChild("Humanoid").Health <= 0 then 
					HumanDied = true
					pcall(function()
						game.Players.LocalPlayer.Character = CloneChar
						CloneChar:Destroy()
						game.Players.LocalPlayer.Character = DeadChar
						if resetBindable then
							game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
							resetBindable:Destroy()
						end
						DeadChar.Humanoid.Health = 0
					end)
					break
				end		
			end
		end)()

		SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["Torso"],CloneChar["Torso"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["Left Arm"],CloneChar["Left Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["Right Arm"],CloneChar["Right Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["Left Leg"],CloneChar["Left Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["Right Leg"],CloneChar["Right Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))

		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if HumanDied then break end
				DeadChar["Torso"].CFrame = CloneChar["Torso"].CFrame
			end
		end)()

		for _,v in next, DeadChar:GetChildren() do
			if v:IsA("Accessory") then
				SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
			end
		end

		for _,BodyParts in next, CloneChar:GetDescendants() do
			if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
				BodyParts.Transparency = 1 end end

		DeadChar.Torso["Left Shoulder"]:Destroy()
		DeadChar.Torso["Right Shoulder"]:Destroy()
		DeadChar.Torso["Left Hip"]:Destroy()
		DeadChar.Torso["Right Hip"]:Destroy()

	elseif Bypass == "death" then --------------------------------------------------------------------------------------------------------------------
		game:GetService("Players").LocalPlayer["Character"].Archivable = true 
		local CloneChar = game:GetService("Players").LocalPlayer["Character"]:Clone()
		game:GetService("Players").LocalPlayer["Character"].Humanoid.WalkSpeed = 0 
		game:GetService("Players").LocalPlayer["Character"].Humanoid.JumpPower = 0 
		game:GetService("Players").LocalPlayer["Character"].Humanoid.AutoRotate = false
		local FalseChar = Instance.new("Model", workspace); FalseChar.Name = ""
		Instance.new("Part",FalseChar).Name = "Head" 
		Instance.new("Part",FalseChar).Name = "Torso" 
		Instance.new("Humanoid",FalseChar).Name = "Humanoid"
		game:GetService("Players").LocalPlayer["Character"] = FalseChar
		game:GetService("Players").LocalPlayer["Character"].Humanoid.Name = "FalseHumanoid"
		local Clone = game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Clone()
		Clone.Parent = game:GetService("Players").LocalPlayer["Character"]
		Clone.Name = "Humanoid"
		game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Destroy() 
		game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0 
		game:GetService("Players").LocalPlayer["Character"] = workspace[game:GetService("Players").LocalPlayer.Name] 
		wait(5.65) 
		game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0
		CloneChar.Parent = workspace 
		CloneChar.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame * CFrame.new(0,2,0)
		wait() 
		CloneChar.Humanoid.BreakJointsOnDeath = false
		workspace.Camera.CameraSubject = CloneChar.Humanoid 
		CloneChar.Name = "non" 
		CloneChar.Humanoid.DisplayDistanceType = "None"
		if CloneChar.Head:FindFirstChild("face") then CloneChar.Head:FindFirstChild("face"):Destroy() end
		if workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face") then workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face").Parent = CloneChar.Head end

		FalseChar:Destroy()

		local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]

		local LVecPart = Instance.new("Part", workspace) LVecPart.CanCollide = false LVecPart.Transparency = 1
		local CONVEC
		local function VECTORUNIT()
			if HumanDied then CONVEC:Disconnect(); return end
			local lookVec = workspace.Camera.CFrame.lookVector
			local Root = CloneChar["HumanoidRootPart"]
			LVecPart.Position = Root.Position
			LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
		end
		CONVEC = game:GetService("RunService").Heartbeat:Connect(VECTORUNIT)

		local CONDOWN
		local WDown, ADown, SDown, DDown, SpaceDown = false, false, false, false, false
		local function KEYDOWN(_,Processed) 
			if HumanDied then CONDOWN:Disconnect(); return end
			if Processed ~= true then
				local Key = _.KeyCode
				if Key == Enum.KeyCode.W then
					WDown = true end
				if Key == Enum.KeyCode.A then
					ADown = true end
				if Key == Enum.KeyCode.S then
					SDown = true end
				if Key == Enum.KeyCode.D then
					DDown = true end
				if Key == Enum.KeyCode.Space then
					SpaceDown = true end end end
		CONDOWN = game:GetService("UserInputService").InputBegan:Connect(KEYDOWN)

		local CONUP
		local function KEYUP(_)
			if HumanDied then CONUP:Disconnect(); return end
			local Key = _.KeyCode
			if Key == Enum.KeyCode.W then
				WDown = false end
			if Key == Enum.KeyCode.A then
				ADown = false end
			if Key == Enum.KeyCode.S then
				SDown = false end
			if Key == Enum.KeyCode.D then
				DDown = false end
			if Key == Enum.KeyCode.Space then
				SpaceDown = false end end
		CONUP = game:GetService("UserInputService").InputEnded:Connect(KEYUP)

		local function MoveClone(X,Y,Z)
			LVecPart.CFrame = LVecPart.CFrame * CFrame.new(-X,Y,-Z)
			workspace["non"].Humanoid.WalkToPoint = LVecPart.Position
		end

		coroutine.wrap(function() 
			while true do game:GetService("RunService").RenderStepped:Wait()
				if HumanDied then break end
				if WDown then MoveClone(0,0,1e4) end
				if ADown then MoveClone(1e4,0,0) end
				if SDown then MoveClone(0,0,-1e4) end
				if DDown then MoveClone(-1e4,0,0) end
				if SpaceDown then CloneChar["Humanoid"].Jump = true end
				if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
					workspace["non"].Humanoid.WalkToPoint = workspace["non"].HumanoidRootPart.Position end
			end 
		end)()

		local con
		function UnCollide()
			if HumanDied then con:Disconnect(); return end
			for _,Parts in next, CloneChar:GetDescendants() do
				if Parts:IsA("BasePart") then
					Parts.CanCollide = false 
				end 
			end
			for _,Parts in next, DeadChar:GetDescendants() do
				if Parts:IsA("BasePart") then
					Parts.CanCollide = false
				end 
			end 
		end
		con = game:GetService("RunService").Stepped:Connect(UnCollide)

		local resetBindable = Instance.new("BindableEvent")
		resetBindable.Event:connect(function()
			game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
			resetBindable:Destroy()
			CloneChar.Humanoid.Health = 0
		end)
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChild("Humanoid") or CloneChar:FindFirstChild("Humanoid").Health <= 0 then 
					HumanDied = true
					pcall(function()
						game.Players.LocalPlayer.Character = CloneChar
						CloneChar:Destroy()
						game.Players.LocalPlayer.Character = DeadChar
						if resetBindable then
							game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
							resetBindable:Destroy()
						end
						DeadChar.Humanoid.Health = 0
					end)
					break
				end		
			end
		end)()

		SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["Torso"],CloneChar["Torso"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["Left Arm"],CloneChar["Left Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["Right Arm"],CloneChar["Right Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["Left Leg"],CloneChar["Left Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["Right Leg"],CloneChar["Right Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["HumanoidRootPart"],CloneChar["HumanoidRootPart"],Vector3.new(0,0,0),Vector3.new(0,0,0))

		for _,v in next, DeadChar:GetChildren() do
			if v:IsA("Accessory") then
				if v.Name == "PlainTail" then
					Tail = CloneChar[v.Name].Handle
				end
				SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
			end
		end

		for _,BodyParts in next, CloneChar:GetDescendants() do
			if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
				BodyParts.Transparency = 1 end end
	elseif Bypass == "hats" then
		game:GetService("Players").LocalPlayer["Character"].Archivable = true 
		local DeadChar = game.Players.LocalPlayer.Character
		DeadChar.Name = "non"
		local HatPosition = Vector3.new(0,0,0)
		local HatName = "MediHood"
		local HatsLimb = {
			Rarm = DeadChar:FindFirstChild("Hat1"),
			Larm = DeadChar:FindFirstChild("Pink Hair"),
			Rleg = DeadChar:FindFirstChild("Robloxclassicred"),
			Lleg = DeadChar:FindFirstChild("Kate Hair"),
			Torso1 = DeadChar:FindFirstChild("Pal Hair"),
			Torso2 = DeadChar:FindFirstChild("LavanderHair")
		}
		HatName = DeadChar:FindFirstChild(HatName)

		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if not DeadChar or not DeadChar:FindFirstChild("Head") or not DeadChar:FindFirstChild("Humanoid") or DeadChar:FindFirstChild("Humanoid").Health <= 0 then 
					HumanDied = true
					pcall(function()
						if resetBindable then
							game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
							resetBindable:Destroy()
						end
						DeadChar.Humanoid.Health = 0
					end)
					break
				end		
			end
		end)()

		local con
		function UnCollide()
			if HumanDied then con:Disconnect(); return end
			for _,Parts in next, DeadChar:GetDescendants() do
				if Parts:IsA("BasePart") then
					Parts.CanCollide = false
				end 
			end 
		end
		con = game:GetService("RunService").Stepped:Connect(UnCollide)

		SCIFIMOVIELOL(HatName.Handle,DeadChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(HatsLimb.Torso1.Handle,DeadChar["Torso"],Vector3.new(0.5,0,0),Vector3.new(90,0,0))
		SCIFIMOVIELOL(HatsLimb.Torso2.Handle,DeadChar["Torso"],Vector3.new(-0.5,0,0),Vector3.new(90,0,0))
		SCIFIMOVIELOL(HatsLimb.Larm.Handle,DeadChar["Left Arm"],Vector3.new(0,0,0),Vector3.new(90,0,0))
		SCIFIMOVIELOL(HatsLimb.Rarm.Handle,DeadChar["Right Arm"],Vector3.new(0,0,0),Vector3.new(90,0,0))
		SCIFIMOVIELOL(HatsLimb.Lleg.Handle,DeadChar["Left Leg"],Vector3.new(0,0,0),Vector3.new(90,0,0))
		SCIFIMOVIELOL(HatsLimb.Rleg.Handle,DeadChar["Right Leg"],Vector3.new(0,0,0),Vector3.new(90,0,0))

		for i,v in pairs(HatsLimb) do
			v.Handle:FindFirstChild("AccessoryWeld"):Destroy()
			if v.Handle:FindFirstChild("Mesh") then v.Handle:FindFirstChild("Mesh"):Destroy() end
			if v.Handle:FindFirstChild("SpecialMesh") then v.Handle:FindFirstChild("SpecialMesh"):Destroy() end
		end
		HatName.Handle:FindFirstChild("AccessoryWeld"):Destroy()
	end
else
	if Bypass == "limbs" then --------------------------------------------------------------------------------------------------------------------
		game:GetService("Players").LocalPlayer["Character"].Archivable = true 
		local CloneChar = game:GetObjects("rbxassetid://5227463276")[1]
		CloneChar.Parent = workspace 
		CloneChar.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame * CFrame.new(0,0.5,0.1)
		CloneChar.Humanoid.BreakJointsOnDeath = false
		workspace.Camera.CameraSubject = CloneChar.Humanoid 
		CloneChar.Name = "non" 
		CloneChar.Humanoid.DisplayDistanceType = "None"
		if CloneChar.Head:FindFirstChild("face") then CloneChar.Head:FindFirstChild("face"):Destroy() end
		if workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face") then workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face").Parent = CloneChar.Head end

		local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]
		DeadChar.HumanoidRootPart:Destroy()

		local LVecPart = Instance.new("Part", workspace) LVecPart.CanCollide = false LVecPart.Transparency = 1
		local CONVEC
		local function VECTORUNIT()
			if HumanDied then CONVEC:Disconnect(); return end
			local lookVec = workspace.Camera.CFrame.lookVector
			local Root = CloneChar["HumanoidRootPart"]
			LVecPart.Position = Root.Position
			LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
		end
		CONVEC = game:GetService("RunService").Heartbeat:Connect(VECTORUNIT)

		local CONDOWN
		local WDown, ADown, SDown, DDown, SpaceDown = false, false, false, false, false
		local function KEYDOWN(_,Processed) 
			if HumanDied then CONDOWN:Disconnect(); return end
			if Processed ~= true then
				local Key = _.KeyCode
				if Key == Enum.KeyCode.W then
					WDown = true end
				if Key == Enum.KeyCode.A then
					ADown = true end
				if Key == Enum.KeyCode.S then
					SDown = true end
				if Key == Enum.KeyCode.D then
					DDown = true end
				if Key == Enum.KeyCode.Space then
					SpaceDown = true end end end
		CONDOWN = game:GetService("UserInputService").InputBegan:Connect(KEYDOWN)

		local CONUP
		local function KEYUP(_)
			if HumanDied then CONUP:Disconnect(); return end
			local Key = _.KeyCode
			if Key == Enum.KeyCode.W then
				WDown = false end
			if Key == Enum.KeyCode.A then
				ADown = false end
			if Key == Enum.KeyCode.S then
				SDown = false end
			if Key == Enum.KeyCode.D then
				DDown = false end
			if Key == Enum.KeyCode.Space then
				SpaceDown = false end end
		CONUP = game:GetService("UserInputService").InputEnded:Connect(KEYUP)

		local function MoveClone(X,Y,Z)
			LVecPart.CFrame = LVecPart.CFrame * CFrame.new(-X,Y,-Z)
			workspace["non"].Humanoid.WalkToPoint = LVecPart.Position
		end

		coroutine.wrap(function() 
			while true do game:GetService("RunService").RenderStepped:Wait()
				if HumanDied then break end
				if WDown then MoveClone(0,0,1e4) end
				if ADown then MoveClone(1e4,0,0) end
				if SDown then MoveClone(0,0,-1e4) end
				if DDown then MoveClone(-1e4,0,0) end
				if SpaceDown then CloneChar["Humanoid"].Jump = true end
				if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
					workspace["non"].Humanoid.WalkToPoint = workspace["non"].HumanoidRootPart.Position end
			end 
		end)()

		local con
		function UnCollide()
			if HumanDied then con:Disconnect(); return end
			for _,Parts in next, CloneChar:GetDescendants() do
				if Parts:IsA("BasePart") then
					Parts.CanCollide = false 
				end 
			end
			for _,Parts in next, DeadChar:GetDescendants() do
				if Parts:IsA("BasePart") then
					Parts.CanCollide = false
				end 
			end 
		end
		con = game:GetService("RunService").Stepped:Connect(UnCollide)

		local resetBindable = Instance.new("BindableEvent")
		resetBindable.Event:connect(function()
			game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
			resetBindable:Destroy()
			CloneChar.Humanoid.Health = 0
		end)
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChild("Humanoid") or CloneChar:FindFirstChild("Humanoid").Health <= 0 or not DeadChar or not DeadChar:FindFirstChild("Head") or not DeadChar:FindFirstChild("Humanoid") or DeadChar:FindFirstChild("Humanoid").Health <= 0 then 
					HumanDied = true
					pcall(function()
						game.Players.LocalPlayer.Character = CloneChar
						CloneChar:Destroy()
						game.Players.LocalPlayer.Character = DeadChar
						if resetBindable then
							game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
							resetBindable:Destroy()
						end
						DeadChar.Humanoid.Health = 0
					end)
					break
				end		
			end
		end)()

		for _,v in next, DeadChar:GetChildren() do
			if v:IsA("Accessory") then
				v:Clone().Parent = CloneChar
			end
		end

		for _,v in next, DeadChar:GetDescendants() do
			if v:IsA("Motor6D") and v.Name ~= "Neck" then
				v:Destroy()
			end
		end

		SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["UpperTorso"],CloneChar["Torso"],Vector3.new(0,0.2,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LowerTorso"],CloneChar["Torso"],Vector3.new(0,-0.78,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LeftUpperArm"],CloneChar["Left Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LeftLowerArm"],CloneChar["Left Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LeftHand"],CloneChar["Left Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightUpperArm"],CloneChar["Right Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightLowerArm"],CloneChar["Right Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightHand"],CloneChar["Right Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))

		SCIFIMOVIELOL(DeadChar["LeftUpperLeg"],CloneChar["Left Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LeftLowerLeg"],CloneChar["Left Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LeftFoot"],CloneChar["Left Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightUpperLeg"],CloneChar["Right Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightLowerLeg"],CloneChar["Right Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightFoot"],CloneChar["Right Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))

		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if HumanDied then break end
				DeadChar["UpperTorso"].CFrame = CloneChar["Torso"].CFrame * CFrame.new(0,0.2,0)
			end
		end)()

		for _,v in next, DeadChar:GetChildren() do
			if v:IsA("Accessory") then
				SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
			end
		end

		for _,BodyParts in next, CloneChar:GetDescendants() do
			if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
				BodyParts.Transparency = 1 end end

	elseif Bypass == "death" then --------------------------------------------------------------------------------------------------------------------
		game:GetService("Players").LocalPlayer["Character"].Archivable = true 
		local CloneChar = game:GetObjects("rbxassetid://5227463276")[1]
		game:GetService("Players").LocalPlayer["Character"].Humanoid.WalkSpeed = 0 
		game:GetService("Players").LocalPlayer["Character"].Humanoid.JumpPower = 0 
		game:GetService("Players").LocalPlayer["Character"].Humanoid.AutoRotate = false
		local FalseChar = Instance.new("Model", workspace); FalseChar.Name = ""
		Instance.new("Part",FalseChar).Name = "Head" 
		Instance.new("Part",FalseChar).Name = "UpperTorso"
		Instance.new("Humanoid",FalseChar).Name = "Humanoid"
		game:GetService("Players").LocalPlayer["Character"] = FalseChar
		game:GetService("Players").LocalPlayer["Character"].Humanoid.Name = "FalseHumanoid"
		local Clone = game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Clone()
		Clone.Parent = game:GetService("Players").LocalPlayer["Character"]
		Clone.Name = "Humanoid"
		game:GetService("Players").LocalPlayer["Character"]:FindFirstChild("FalseHumanoid"):Destroy() 
		game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0 
		game:GetService("Players").LocalPlayer["Character"] = workspace[game:GetService("Players").LocalPlayer.Name] 
		wait(5.65) 
		game:GetService("Players").LocalPlayer["Character"].Humanoid.Health = 0
		CloneChar.Parent = workspace 
		CloneChar.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame * CFrame.new(0,0.5,0.1)
		wait() 
		CloneChar.Humanoid.BreakJointsOnDeath = false
		workspace.Camera.CameraSubject = CloneChar.Humanoid 
		CloneChar.Name = "non" 
		CloneChar.Humanoid.DisplayDistanceType = "None"
		if CloneChar.Head:FindFirstChild("face") then CloneChar.Head:FindFirstChild("face"):Destroy() end
		if workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face") then workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face").Parent = CloneChar.Head end

		FalseChar:Destroy()

		local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]

		local LVecPart = Instance.new("Part", workspace) LVecPart.CanCollide = false LVecPart.Transparency = 1
		local CONVEC
		local function VECTORUNIT()
			if HumanDied then CONVEC:Disconnect(); return end
			local lookVec = workspace.Camera.CFrame.lookVector
			local Root = CloneChar["HumanoidRootPart"]
			LVecPart.Position = Root.Position
			LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
		end
		CONVEC = game:GetService("RunService").Heartbeat:Connect(VECTORUNIT)

		local CONDOWN
		local WDown, ADown, SDown, DDown, SpaceDown = false, false, false, false, false
		local function KEYDOWN(_,Processed) 
			if HumanDied then CONDOWN:Disconnect(); return end
			if Processed ~= true then
				local Key = _.KeyCode
				if Key == Enum.KeyCode.W then
					WDown = true end
				if Key == Enum.KeyCode.A then
					ADown = true end
				if Key == Enum.KeyCode.S then
					SDown = true end
				if Key == Enum.KeyCode.D then
					DDown = true end
				if Key == Enum.KeyCode.Space then
					SpaceDown = true end end end
		CONDOWN = game:GetService("UserInputService").InputBegan:Connect(KEYDOWN)

		local CONUP
		local function KEYUP(_)
			if HumanDied then CONUP:Disconnect(); return end
			local Key = _.KeyCode
			if Key == Enum.KeyCode.W then
				WDown = false end
			if Key == Enum.KeyCode.A then
				ADown = false end
			if Key == Enum.KeyCode.S then
				SDown = false end
			if Key == Enum.KeyCode.D then
				DDown = false end
			if Key == Enum.KeyCode.Space then
				SpaceDown = false end end
		CONUP = game:GetService("UserInputService").InputEnded:Connect(KEYUP)

		local function MoveClone(X,Y,Z)
			LVecPart.CFrame = LVecPart.CFrame * CFrame.new(-X,Y,-Z)
			workspace["non"].Humanoid.WalkToPoint = LVecPart.Position
		end

		coroutine.wrap(function() 
			while true do game:GetService("RunService").RenderStepped:Wait()
				if HumanDied then break end
				if WDown then MoveClone(0,0,1e4) end
				if ADown then MoveClone(1e4,0,0) end
				if SDown then MoveClone(0,0,-1e4) end
				if DDown then MoveClone(-1e4,0,0) end
				if SpaceDown then CloneChar["Humanoid"].Jump = true end
				if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
					workspace["non"].Humanoid.WalkToPoint = workspace["non"].HumanoidRootPart.Position end
			end 
		end)()

		local con
		function UnCollide()
			if HumanDied then con:Disconnect(); return end
			for _,Parts in next, CloneChar:GetDescendants() do
				if Parts:IsA("BasePart") then
					Parts.CanCollide = false 
				end 
			end
			for _,Parts in next, DeadChar:GetDescendants() do
				if Parts:IsA("BasePart") then
					Parts.CanCollide = false
				end 
			end 
		end
		con = game:GetService("RunService").Stepped:Connect(UnCollide)

		local resetBindable = Instance.new("BindableEvent")
		resetBindable.Event:connect(function()
			game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
			resetBindable:Destroy()
			CloneChar.Humanoid.Health = 0
		end)
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChild("Humanoid") or CloneChar:FindFirstChild("Humanoid").Health <= 0 then 
					HumanDied = true
					pcall(function()
						game.Players.LocalPlayer.Character = CloneChar
						CloneChar:Destroy()
						game.Players.LocalPlayer.Character = DeadChar
						if resetBindable then
							game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
							resetBindable:Destroy()
						end
						DeadChar.Humanoid.Health = 0
					end)
					break
				end		
			end
		end)()

		for _,v in next, DeadChar:GetChildren() do
			if v:IsA("Accessory") then
				v:Clone().Parent = CloneChar
			end
		end

		SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["UpperTorso"],CloneChar["Torso"],Vector3.new(0,0.2,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LowerTorso"],CloneChar["Torso"],Vector3.new(0,-0.78,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LeftUpperArm"],CloneChar["Left Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LeftLowerArm"],CloneChar["Left Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LeftHand"],CloneChar["Left Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightUpperArm"],CloneChar["Right Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightLowerArm"],CloneChar["Right Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightHand"],CloneChar["Right Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))

		SCIFIMOVIELOL(DeadChar["LeftUpperLeg"],CloneChar["Left Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LeftLowerLeg"],CloneChar["Left Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["LeftFoot"],CloneChar["Left Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightUpperLeg"],CloneChar["Right Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightLowerLeg"],CloneChar["Right Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
		SCIFIMOVIELOL(DeadChar["RightFoot"],CloneChar["Right Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))

		SCIFIMOVIELOL(DeadChar["HumanoidRootPart"],CloneChar["HumanoidRootPart"],Vector3.new(0,0,0),Vector3.new(0,0,0))

		for _,v in next, DeadChar:GetChildren() do
			if v:IsA("Accessory") then
				SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
			end
		end

		for _,BodyParts in next, CloneChar:GetDescendants() do
			if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
				BodyParts.Transparency = 1 end end
		if DeadChar.Head:FindFirstChild("Neck") then
			game.Players.LocalPlayer.Character:BreakJoints()
		end
	end
end
local CloneChar = workspace.non

s = game:GetService("RunService").Heartbeat:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,35,0)
end)
task.spawn(function()
	while true do
		wait()
		if HumanDied == true then
			s:Disconnect()
			break
		end
	end
end)
local SHOW = Instance.new("SelectionBox",workspace)
SHOW.Adornee = game.Players.LocalPlayer.Character.HumanoidRootPart




























































title = [[

//    D I M E N S I O N A    //

Made by @Kyutatsuki#9221 

Converted to FE by Creo#7499

[CTRL] Walk
[E] Front Warp
[Q] Vertical Warp

[Click] Slash

"/e play [id]"
in Visualizer mode

[Y] Switch Mode GUI
[H] Open/Close Help GUI

Build 0005
]]
backgroundcolortitle = Color3.fromHSV(0, 0, 0.05)
bordercolortitle = Color3.fromHSV(0, 0, 0.2)
local name = game.Players.LocalPlayer.Name
local p = game:GetService("Players"):WaitForChild(name)
local char = CloneChar
local larm = char:WaitForChild("Left Arm")
local rarm = char:WaitForChild("Right Arm")
local lleg = char:WaitForChild("Left Leg")
local rleg = char:WaitForChild("Right Leg")
local hed = char:WaitForChild("Head")
local torso = char:WaitForChild("Torso")
local root = char:WaitForChild("HumanoidRootPart")
local hum = char:FindFirstChildOfClass("Humanoid")
local debris = game:GetService("Debris")
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local rs = run.RenderStepped
local wingpose = "Idle"
local DebrisModel = Instance.new("Model", workspace)
local lplr = game:GetService("Players").LocalPlayer
local mouse = lplr:GetMouse()
local pose = "Idle"
local musicplay = true
local musictrack = 1
local blinktime = 0
local blinking = false
local walking = false
local woosh = false
local debounce = false
local currentmusic
DebrisModel.Name = "Debris"
repeat
	rs:wait()
until p.CharacterAppearanceLoaded
animsync = false
noidle = false
noidle2 = false
shift = false
control = false
modeslist = {}
currentmode = nil
function rad(var)
	return math.rad(var)
end
function animation(token)
	if plr == lplr then
		pose = token
	end
	if -root.Velocity.Y / 1.5 > -5 and -root.Velocity.Y / 1.5 < 150 then
		velocityYFall = root.Velocity.Y / 1.5
	elseif -root.Velocity.Y / 1.5 < -5 then
		velocityYFall = 5
	elseif -root.Velocity.Y / 1.5 > 150 then
		velocityYFall = -150
	end
	if -root.Velocity.Y / 180 > 0 and -root.Velocity.Y / 180 < 1.2 then
		velocityYFall2 = root.Velocity.Y / 180
	elseif -root.Velocity.Y / 180 < 0 then
		velocityYFall2 = 0
	elseif -root.Velocity.Y / 180 > 1.2 then
		velocityYFall2 = -1.2
	end
	if -root.Velocity.Y / 1.5 > -5 and -root.Velocity.Y / 1.5 < 50 then
		velocityYFall3 = root.Velocity.Y / 1.5
	elseif -root.Velocity.Y / 1.5 < -5 then
		velocityYFall3 = 5
	elseif -root.Velocity.Y / 1.5 > 50 then
		velocityYFall3 = -50
	end
	if -root.Velocity.Y / 1.5 > -50 and -root.Velocity.Y / 1.5 < 20 then
		velocityYFall4 = root.Velocity.Y / 1.5
	elseif -5 > -root.Velocity.Y / 180 then
		velocityYFall4 = 5
	elseif -root.Velocity.Y / 180 > 50 then
		velocityYFall4 = -50
	end
	if root.RotVelocity.Y / 6 < 1 and root.RotVelocity.Y / 6 > -1 then
		neckrotY = root.RotVelocity.Y / 6
	elseif root.RotVelocity.Y / 6 < -1 then
		neckrotY = -1
	elseif root.RotVelocity.Y / 6 > 1 then
		neckrotY = 1
	end
	if root.RotVelocity.Y / 8 < 0.6 and root.RotVelocity.Y / 8 > -0.6 then
		neckrotY2 = root.RotVelocity.Y / 8
	elseif root.RotVelocity.Y / 8 < -0.6 then
		neckrotY2 = -0.6
	elseif root.RotVelocity.Y / 8 > 0.6 then
		neckrotY2 = 0.6
	end
	if root.RotVelocity.Y / 6 < 0.2 and root.RotVelocity.Y / 6 > -0.2 then
		torsorotY = root.RotVelocity.Y / 6
	elseif root.RotVelocity.Y / 6 < -0.2 then
		torsorotY = -0.2
	elseif root.RotVelocity.Y / 6 > 0.2 then
		torsorotY = 0.2
	end
	if root.RotVelocity.Y / 8 < 0.2 and root.RotVelocity.Y / 8 > -0.2 then
		torsorotY2 = root.RotVelocity.Y / 8
	elseif root.RotVelocity.Y / 8 < -0.2 then
		torsorotY2 = -0.2
	elseif root.RotVelocity.Y / 8 > 0.2 then
		torsorotY2 = 0.2
	end
	torsoY = -(torso.Velocity * Vector3.new(1, 0, 1)).magnitude / 20
	torsoY2 = -(torso.Velocity * Vector3.new(1, 0, 1)).magnitude / 36
	local rlegray = Ray.new(rleg.Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -1.75, 0))
	local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
	local llegray = Ray.new(lleg.Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -1.75, 0))
	local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
	local rightvector = (root.Velocity * torso.CFrame.rightVector).X + (root.Velocity * torso.CFrame.rightVector).Z
	local lookvector = (root.Velocity * torso.CFrame.lookVector).X + (root.Velocity * torso.CFrame.lookVector).Z
	if lookvector > hum.WalkSpeed then
		lookvector = hum.WalkSpeed
	end
	if lookvector < -hum.WalkSpeed then
		lookvector = -hum.WalkSpeed
	end
	if rightvector > hum.WalkSpeed then
		rightvector = hum.WalkSpeed
	end
	if rightvector < -hum.WalkSpeed then
		rightvector = -hum.WalkSpeed
	end
	local lookvel = lookvector / hum.WalkSpeed
	local rightvel = rightvector / hum.WalkSpeed
	local lookvel2 = lookvel
	if lookvel2 < 0 then
		lookvel2 = 0
	end
	if token == "Idle" then
		if noidle == false then
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1), 0.4)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55 - 0.1 * math.cos(sine / 16) / 3, -0.05 - 0.1 * math.cos(sine / 16)) * CFrame.Angles(rad(-2 + 4 * math.sin(sine / 16)), rad(0 - 5 * math.sin(sine / 16)), rad(-4 + 2 * math.cos(sine / 16))), 0.2)
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55 - 0.1 * math.cos(sine / 16) / 3, -0.05 - 0.1 * math.cos(sine / 16)) * CFrame.Angles(rad(-2 + 4 * math.sin(sine / 16)), rad(0 + 5 * math.sin(sine / 16)), rad(4 - 2 * math.cos(sine / 16))), 0.2)
			if currentmode == modeslist[1] then
				change = 1
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0.05 * math.sin(sine / 16) + 0.15, rad(40) + 0.05 * math.cos(sine / 32), 0.01 * math.cos(sine / 32)), 0.1)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.1 - 0.1 * math.cos(sine / 16) - hum.HipHeight, 0) * CFrame.Angles(rad(0 - 2 * math.cos(sine / 16)), rad(40), rad(0 - 1 * math.cos(sine / 32))), 0.1)
			elseif currentmode == modeslist[2] then
				change = 1.5
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0.05 * math.sin(sine / 16) + 0.15, rad(30) + 0.05 * math.cos(sine / 32), 0.01 * math.cos(sine / 32)), 0.1)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.1 - 0.1 * math.cos(sine / 16) - hum.HipHeight, 0) * CFrame.Angles(rad(0 - 2 * math.cos(sine / 16)), rad(30), rad(0 - 1 * math.cos(sine / 32))), 0.1)
			elseif currentmode == modeslist[3] then
				change = 1
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0.05 * math.sin(sine / 16) + 0.15, rad(20) + 0.05 * math.cos(sine / 32), 0.01 * math.cos(sine / 32)), 0.1)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.1 - 0.1 * math.cos(sine / 16) - hum.HipHeight, 0) * CFrame.Angles(rad(0 - 2 * math.cos(sine / 16)), rad(20), rad(0 - 1 * math.cos(sine / 32))), 0.1)
			elseif currentmode == modeslist[4] then
				change = 1
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0.05 * math.sin(sine / 16) + 0.15, rad(10) + 0.05 * math.cos(sine / 32), 0.01 * math.cos(sine / 32)), 0.1)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.1 - 0.1 * math.cos(sine / 16) - hum.HipHeight, 0) * CFrame.Angles(rad(0 - 2 * math.cos(sine / 16)), rad(10), rad(0 - 1 * math.cos(sine / 32))), 0.1)
			elseif currentmode == modeslist[5] then
				change = 1.25
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0.05 * math.sin(sine / 16) + 0.15, rad(-10) + 0.05 * math.cos(sine / 32), 0.01 * math.cos(sine / 32)), 0.1)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.1 - 0.1 * math.cos(sine / 16) - hum.HipHeight, 0) * CFrame.Angles(rad(0 - 2 * math.cos(sine / 16)), rad(-10), rad(0 - 1 * math.cos(sine / 32))), 0.1)
			elseif currentmode == modeslist[6] then
				change = 1.25
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0.05 * math.sin(sine / 16) + 0.15, rad(-20) + 0.05 * math.cos(sine / 32), 0.01 * math.cos(sine / 32)), 0.1)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.1 - 0.1 * math.cos(sine / 16) - hum.HipHeight, 0) * CFrame.Angles(rad(0 - 2 * math.cos(sine / 16)), rad(-20), rad(0 - 1 * math.cos(sine / 32))), 0.1)
			elseif currentmode == modeslist[7] then
				change = 0.75
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0.05 * math.sin(sine / 16) + 0.15, rad(-30) + 0.05 * math.cos(sine / 32), 0.01 * math.cos(sine / 32)), 0.1)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.1 - 0.1 * math.cos(sine / 16) - hum.HipHeight, 0) * CFrame.Angles(rad(0 - 2 * math.cos(sine / 16)), rad(-30), rad(0 - 1 * math.cos(sine / 32))), 0.1)
			elseif currentmode == modeslist[8] then
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0.05 * math.sin(sine / 16) + 0.15, rad(-40) + 0.05 * math.cos(sine / 32), 0.01 * math.cos(sine / 32)), 0.1)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.1 - 0.1 * math.cos(sine / 16) - hum.HipHeight, 0) * CFrame.Angles(rad(0 - 2 * math.cos(sine / 16)), rad(-40), rad(0 - 1 * math.cos(sine / 32))), 0.1)
			end
		end
		if noidle2 == false then
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(0, llegendPoint.Y - lleg.Position.Y, 0) * CFrame.new(-0.5, 0 + 0.1 * math.cos(sine / 16), 0) * CFrame.Angles(rad(-1 + 2 * math.cos(sine / 16)), rad(10), rad(-5 + 1 * math.cos(sine / 32))), 0.1)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0, rlegendPoint.Y - rleg.Position.Y, 0) * CFrame.new(0.5, 0 + 0.1 * math.cos(sine / 16), 0) * CFrame.Angles(rad(-1 + 2 * math.cos(sine / 16)), rad(-10), rad(5 + 1 * math.cos(sine / 32))), 0.1)
		end
	elseif token == "Run" then
		if noidle == false then
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1 - 0.1 * lookvel) * CFrame.Angles(0, torsorotY, rad(0) + torsorotY), 0.4)
			hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles((change / 10 * math.cos(sine / 2) + 0.1) * lookvel ^ 2, -(change / 10) * math.cos(sine / 4) - torsorotY / 5, change / 5 * math.cos(sine / 4)), 0.1)
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, (0.5 + 0.12 * lookvel ^ 2 - movement / 40 * math.cos(sine / 4) / 3) / 10 + 0.5, movement / 150 + movement / 40 * math.cos(sine / 4)) * CFrame.Angles((rad(-5 - movement * 2 * math.cos(sine / 4)) + -(movement / 10) * math.sin(sine / 4)) * lookvel / 10 + rad(30), rad(50 - movement * 2 * math.cos(sine / 4)) / 10, -rad(movement * 1 * 0.2 - movement * 1 * math.cos(sine / 2) * lookvel) + rad(-5 * rightvel) / 10 + rad(60 * (lookvel2 * change))), 0.2)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5 + 0.12 * lookvel ^ 2 + movement / 40 * math.cos(sine / 4) / 3, movement / 150 - movement / 40 * math.cos(sine / 4)) * CFrame.Angles((rad(-5 + movement * 2 * math.cos(sine / 4)) + movement / 10 * math.sin(sine / 4)) * lookvel, rad(0 - movement * 2 * math.cos(sine / 4)), -rad(-(movement * 1) * 0.2 + movement * 1 * math.cos(sine / 2) * lookvel) + rad(-5 * rightvel)), 0.2)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.05 + change / 2 * math.cos(sine / 2), 0) * CFrame.Angles(rad(-(change * 20) - movement / 20 * math.cos(sine / 2)) * lookvel, torsorotY2 + rad(0 - 4 * math.sin(sine / 4)), rad(-(change * 20) - movement / 20 * math.cos(sine / 2)) * rightvel + torsorotY2 + rad(0 - 1 * math.cos(sine / 4))), 0.1)
		end
		if noidle2 == false then
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.85 - movement / 15 * math.cos(sine / 4) / 2, (-0.1 + movement / 15 * math.cos(sine / 4)) * (0.5 + 0.5 * lookvel)) * CFrame.Angles((rad(-10 * lookvel + change * 5 - movement * math.cos(sine / 4)) + -(movement / 10) * math.sin(sine / 4)) * lookvel, rad(0 + movement * 2 * math.cos(sine / 4)), (rad(change * 5 - movement * math.cos(sine / 4)) + -(movement / 10) * math.sin(sine / 4)) * (rightvector / (hum.WalkSpeed * 2))), 0.2)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.85 + movement / 15 * math.cos(sine / 4) / 2, (-0.1 - movement / 15 * math.cos(sine / 4)) * (0.5 + 0.5 * lookvel)) * CFrame.Angles((rad(-10 * lookvel + change * 5 + movement * math.cos(sine / 4)) + movement / 10 * math.sin(sine / 4)) * lookvel, rad(0 + movement * 2 * math.cos(sine / 4)), (rad(change * 5 + movement * math.cos(sine / 4)) + movement / 10 * math.sin(sine / 4)) * (rightvector / (hum.WalkSpeed * 2))), 0.2)
		end
	elseif token == "Jump" then
		if noidle == false then
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1) * CFrame.Angles(0, 0, 0), 0.4)
			hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(rad(-velocityYFall3 / 5), 0, 0), 0.1)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55 - velocityYFall3 / 70, 0) * CFrame.Angles(rad(-velocityYFall3 / 10), rad(0), rad(velocityYFall)), 0.2)
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55 - velocityYFall3 / 70, 0) * CFrame.Angles(rad(-velocityYFall3 / 10), rad(0), rad(-velocityYFall)), 0.2)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(rad(-(change * 20) - movement / 20 * math.cos(sine / 2)) * (lookvector / (hum.WalkSpeed * 2)) + rad(velocityYFall3 / 10), rad(0), rad(-(change * 20) - movement / 20 * math.cos(sine / 2)) * (rightvector / (hum.WalkSpeed * 2))), 0.1)
		end
		if noidle2 == false then
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.925, 0) * CFrame.Angles(rad(-35), rad(0), rad(-2)), 0.2)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, 0, -0.8) * CFrame.Angles(rad(-25), rad(0), rad(2)), 0.2)
		end
	elseif token == "Sit" then
		change = 1
		if noidle == false then
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1), 0.4)
			hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0.05 * math.sin(sine / 16) + 0.15, 0.05 * math.cos(sine / 32), 0.01 * math.cos(sine / 32)), 0.1)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55 - 0.1 * math.cos(sine / 16) / 3, -0.05 - 0.1 * math.cos(sine / 16)) * CFrame.Angles(rad(-2 + 4 * math.sin(sine / 16)), rad(-5 - 5 * math.sin(sine / 16)), rad(-6 + 2 * math.cos(sine / 16))), 0.2)
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55 - 0.1 * math.cos(sine / 16) / 3, -0.05 - 0.1 * math.cos(sine / 16)) * CFrame.Angles(rad(-2 + 4 * math.sin(sine / 16)), rad(5 + 5 * math.sin(sine / 16)), rad(6 - 2 * math.cos(sine / 16))), 0.2)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.4 - 0.1 * math.cos(sine / 16) - hum.HipHeight, 0) * CFrame.Angles(rad(0 - 2 * math.cos(sine / 16)), rad(0), rad(0 - 1 * math.cos(sine / 32))), 0.1)
		end
		if noidle2 == false then
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.55 + 0.1 * math.cos(sine / 16), 0) * CFrame.Angles(rad(80 + 2 * math.cos(sine / 16)), rad(4), rad(-2 + 1 * math.cos(sine / 32))), 0.2)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.55 + 0.1 * math.cos(sine / 16), 0) * CFrame.Angles(rad(80 + 2 * math.cos(sine / 16)), rad(-4), rad(2 + 1 * math.cos(sine / 32))), 0.2)
		end
	end
end
function animationwing(token)
	if plr == lplr then
		pose = token
	end
	if -root.Velocity.Y / 1.5 > -5 and -root.Velocity.Y / 1.5 < 150 then
		velocityYFall = root.Velocity.Y / 1.5
	elseif -root.Velocity.Y / 1.5 < -5 then
		velocityYFall = 5
	elseif -root.Velocity.Y / 1.5 > 150 then
		velocityYFall = -150
	end
	if -root.Velocity.Y / 180 > 0 and -root.Velocity.Y / 180 < 1.2 then
		velocityYFall2 = root.Velocity.Y / 180
	elseif -root.Velocity.Y / 180 < 0 then
		velocityYFall2 = 0
	elseif -root.Velocity.Y / 180 > 1.2 then
		velocityYFall2 = -1.2
	end
	if -root.Velocity.Y / 1.5 > -5 and -root.Velocity.Y / 1.5 < 50 then
		velocityYFall3 = root.Velocity.Y / 1.5
	elseif -root.Velocity.Y / 1.5 < -5 then
		velocityYFall3 = 5
	elseif -root.Velocity.Y / 1.5 > 50 then
		velocityYFall3 = -50
	end
	if -root.Velocity.Y / 1.5 > -50 and -root.Velocity.Y / 1.5 < 20 then
		velocityYFall4 = root.Velocity.Y / 1.5
	elseif -5 > -root.Velocity.Y / 180 then
		velocityYFall4 = 5
	elseif -root.Velocity.Y / 180 > 50 then
		velocityYFall4 = -50
	end
	if root.RotVelocity.Y / 6 < 1 and root.RotVelocity.Y / 6 > -1 then
		neckrotY = root.RotVelocity.Y / 6
	elseif root.RotVelocity.Y / 6 < -1 then
		neckrotY = -1
	elseif root.RotVelocity.Y / 6 > 1 then
		neckrotY = 1
	end
	if root.RotVelocity.Y / 8 < 0.6 and root.RotVelocity.Y / 8 > -0.6 then
		neckrotY2 = root.RotVelocity.Y / 8
	elseif root.RotVelocity.Y / 8 < -0.6 then
		neckrotY2 = -0.6
	elseif root.RotVelocity.Y / 8 > 0.6 then
		neckrotY2 = 0.6
	end
	if root.RotVelocity.Y / 6 < 0.2 and root.RotVelocity.Y / 6 > -0.2 then
		torsorotY = root.RotVelocity.Y / 6
	elseif root.RotVelocity.Y / 6 < -0.2 then
		torsorotY = -0.2
	elseif root.RotVelocity.Y / 6 > 0.2 then
		torsorotY = 0.2
	end
	if root.RotVelocity.Y / 8 < 0.2 and root.RotVelocity.Y / 8 > -0.2 then
		torsorotY2 = root.RotVelocity.Y / 8
	elseif root.RotVelocity.Y / 8 < -0.2 then
		torsorotY2 = -0.2
	elseif root.RotVelocity.Y / 8 > 0.2 then
		torsorotY2 = 0.2
	end
	torsoY = -(torso.Velocity * Vector3.new(1, 0, 1)).magnitude / 20
	torsoY2 = -(torso.Velocity * Vector3.new(1, 0, 1)).magnitude / 36
	local rlegray = Ray.new(rleg.Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -1.75, 0))
	local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
	local llegray = Ray.new(lleg.Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -1.75, 0))
	local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
	local rightvector = (root.Velocity * torso.CFrame.rightVector).X + (root.Velocity * torso.CFrame.rightVector).Z
	local lookvector = (root.Velocity * torso.CFrame.lookVector).X + (root.Velocity * torso.CFrame.lookVector).Z
	if lookvector > hum.WalkSpeed then
		lookvector = hum.WalkSpeed
	end
	if lookvector < -hum.WalkSpeed then
		lookvector = -hum.WalkSpeed
	end
	if rightvector > hum.WalkSpeed then
		rightvector = hum.WalkSpeed
	end
	if rightvector < -hum.WalkSpeed then
		rightvector = -hum.WalkSpeed
	end
	local lookvel = lookvector / hum.WalkSpeed
	local rightvel = rightvector / hum.WalkSpeed
	local lookvel2 = lookvel
	if lookvel2 < 0 then
		lookvel2 = 0
	end
	local asdfw = 0.1
	if token == "Idle" then
		wingsweld.a.main.C0 = Lerp(wingsweld.a.main.C0, CFrame.new(-1.3, 0.7, 0.9) * CFrame.Angles(0, rad(10), rad(50 + 10 * math.sin(sine / 14))), asdfw)
		wingsweld.b.main.C0 = Lerp(wingsweld.b.main.C0, CFrame.new(1.3, 0.7, 0.9) * CFrame.Angles(0, rad(-10), rad(-50 - 10 * math.sin(sine / 14))), asdfw)
		wingsweld.a.a.a.C0 = Lerp(wingsweld.a.a.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(10 + 30 * math.cos(sine / 14)), 0), asdfw)
		wingsweld.a.b.a.C0 = Lerp(wingsweld.a.b.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-10 + 25 * math.cos(sine / 14)), 0), asdfw)
		wingsweld.a.c.a.C0 = Lerp(wingsweld.a.c.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-30 + 20 * math.cos(sine / 14)), 0), asdfw)
		wingsweld.b.a.a.C0 = Lerp(wingsweld.b.a.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(10 + 30 * math.cos(sine / 14)), 0), asdfw)
		wingsweld.b.b.a.C0 = Lerp(wingsweld.b.b.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-10 + 25 * math.cos(sine / 14)), 0), asdfw)
		wingsweld.b.c.a.C0 = Lerp(wingsweld.b.c.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-30 + 20 * math.cos(sine / 14)), 0), asdfw)
		wingsweld.a.a.b.C0 = Lerp(wingsweld.a.a.b.C0, CFrame.new(0, 0, 4.5) * CFrame.Angles(0, rad(-30 + 30 * math.sin(sine / 14) - 15 * math.cos(sine / 14)), 0), asdfw)
		wingsweld.a.b.b.C0 = Lerp(wingsweld.a.b.b.C0, CFrame.new(0, 0, 4.25) * CFrame.Angles(0, rad(-30 + 25 * math.sin(sine / 14) - 10 * math.cos(sine / 14)), 0), asdfw)
		wingsweld.a.c.b.C0 = Lerp(wingsweld.a.c.b.C0, CFrame.new(0, 0, 4) * CFrame.Angles(0, rad(-30 + 20 * math.sin(sine / 14) - 5 * math.cos(sine / 14)), 0), asdfw)
		wingsweld.b.a.b.C0 = Lerp(wingsweld.b.a.b.C0, CFrame.new(0, 0, 4.5) * CFrame.Angles(0, rad(-30 + 30 * math.sin(sine / 14) - 15 * math.cos(sine / 14)), 0), asdfw)
		wingsweld.b.b.b.C0 = Lerp(wingsweld.b.b.b.C0, CFrame.new(0, 0, 4.25) * CFrame.Angles(0, rad(-30 + 25 * math.sin(sine / 14) - 10 * math.cos(sine / 14)), 0), asdfw)
		wingsweld.b.c.b.C0 = Lerp(wingsweld.b.c.b.C0, CFrame.new(0, 0, 4) * CFrame.Angles(0, rad(-30 + 20 * math.sin(sine / 14) - 5 * math.cos(sine / 14)), 0), asdfw)
	elseif token == "Run" then
		wingsweld.a.main.C0 = Lerp(wingsweld.a.main.C0, CFrame.new(-1.3, 0.7, 0.9) * CFrame.Angles(0, rad(70 * (0.5 + 0.5 * lookvel)), rad(50 + 2 * math.sin(sine / 2))), asdfw)
		wingsweld.b.main.C0 = Lerp(wingsweld.b.main.C0, CFrame.new(1.3, 0.7, 0.9) * CFrame.Angles(0, rad(-70 * (0.5 + 0.5 * lookvel)), rad(-50 - 2 * math.sin(sine / 2))), asdfw)
		wingsweld.a.a.a.C0 = Lerp(wingsweld.a.a.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-20 + 5 * math.cos(sine / 2)), 0), asdfw)
		wingsweld.a.b.a.C0 = Lerp(wingsweld.a.b.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-40 + 5 * math.cos(sine / 2)), 0), asdfw)
		wingsweld.a.c.a.C0 = Lerp(wingsweld.a.c.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-60 + 5 * math.cos(sine / 2)), 0), asdfw)
		wingsweld.b.a.a.C0 = Lerp(wingsweld.b.a.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-20 + 5 * math.cos(sine / 2)), 0), asdfw)
		wingsweld.b.b.a.C0 = Lerp(wingsweld.b.b.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-40 + 5 * math.cos(sine / 2)), 0), asdfw)
		wingsweld.b.c.a.C0 = Lerp(wingsweld.b.c.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-60 + 5 * math.cos(sine / 2)), 0), asdfw)
		wingsweld.a.a.b.C0 = Lerp(wingsweld.a.a.b.C0, CFrame.new(0, 0, 4.5) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
		wingsweld.a.b.b.C0 = Lerp(wingsweld.a.b.b.C0, CFrame.new(0, 0, 4.25) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
		wingsweld.a.c.b.C0 = Lerp(wingsweld.a.c.b.C0, CFrame.new(0, 0, 4) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
		wingsweld.b.a.b.C0 = Lerp(wingsweld.b.a.b.C0, CFrame.new(0, 0, 4.5) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
		wingsweld.b.b.b.C0 = Lerp(wingsweld.b.b.b.C0, CFrame.new(0, 0, 4.25) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
		wingsweld.b.c.b.C0 = Lerp(wingsweld.b.c.b.C0, CFrame.new(0, 0, 4) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
	elseif token == "Jump" then
		if root.Velocity.Y > 0 then
			wingsweld.a.main.C0 = Lerp(wingsweld.a.main.C0, CFrame.new(-1.3, 0.7, 0.9) * CFrame.Angles(0, rad(0 * (0.5 + 0.5 * lookvel)), rad(70 + 2 * math.sin(sine / 4))), asdfw)
			wingsweld.b.main.C0 = Lerp(wingsweld.b.main.C0, CFrame.new(1.3, 0.7, 0.9) * CFrame.Angles(0, rad(0 * (0.5 + 0.5 * lookvel)), rad(-70 - 2 * math.sin(sine / 4))), asdfw)
			wingsweld.a.a.a.C0 = Lerp(wingsweld.a.a.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-20 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.a.b.a.C0 = Lerp(wingsweld.a.b.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-40 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.a.c.a.C0 = Lerp(wingsweld.a.c.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-60 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.b.a.a.C0 = Lerp(wingsweld.b.a.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-20 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.b.b.a.C0 = Lerp(wingsweld.b.b.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-40 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.b.c.a.C0 = Lerp(wingsweld.b.c.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-60 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.a.a.b.C0 = Lerp(wingsweld.a.a.b.C0, CFrame.new(0, 0, 4.5) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
			wingsweld.a.b.b.C0 = Lerp(wingsweld.a.b.b.C0, CFrame.new(0, 0, 4.25) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
			wingsweld.a.c.b.C0 = Lerp(wingsweld.a.c.b.C0, CFrame.new(0, 0, 4) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
			wingsweld.b.a.b.C0 = Lerp(wingsweld.b.a.b.C0, CFrame.new(0, 0, 4.5) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
			wingsweld.b.b.b.C0 = Lerp(wingsweld.b.b.b.C0, CFrame.new(0, 0, 4.25) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
			wingsweld.b.c.b.C0 = Lerp(wingsweld.b.c.b.C0, CFrame.new(0, 0, 4) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
		else
			wingsweld.a.main.C0 = Lerp(wingsweld.a.main.C0, CFrame.new(-1.3, 0.7, 0.9) * CFrame.Angles(0, rad(0 * (0.5 + 0.5 * lookvel)), rad(-20 + 2 * math.sin(sine / 4))), asdfw)
			wingsweld.b.main.C0 = Lerp(wingsweld.b.main.C0, CFrame.new(1.3, 0.7, 0.9) * CFrame.Angles(0, rad(0 * (0.5 + 0.5 * lookvel)), rad(20 - 2 * math.sin(sine / 4))), asdfw)
			wingsweld.a.a.a.C0 = Lerp(wingsweld.a.a.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-20 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.a.b.a.C0 = Lerp(wingsweld.a.b.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-25 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.a.c.a.C0 = Lerp(wingsweld.a.c.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-30 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.b.a.a.C0 = Lerp(wingsweld.b.a.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-20 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.b.b.a.C0 = Lerp(wingsweld.b.b.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-25 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.b.c.a.C0 = Lerp(wingsweld.b.c.a.C0, CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(-30 + 5 * math.cos(sine / 2)), 0), asdfw)
			wingsweld.a.a.b.C0 = Lerp(wingsweld.a.a.b.C0, CFrame.new(0, 0, 4.5) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
			wingsweld.a.b.b.C0 = Lerp(wingsweld.a.b.b.C0, CFrame.new(0, 0, 4.25) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
			wingsweld.a.c.b.C0 = Lerp(wingsweld.a.c.b.C0, CFrame.new(0, 0, 4) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
			wingsweld.b.a.b.C0 = Lerp(wingsweld.b.a.b.C0, CFrame.new(0, 0, 4.5) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
			wingsweld.b.b.b.C0 = Lerp(wingsweld.b.b.b.C0, CFrame.new(0, 0, 4.25) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
			wingsweld.b.c.b.C0 = Lerp(wingsweld.b.c.b.C0, CFrame.new(0, 0, 4) * CFrame.Angles(0, rad(-30 + 5 * math.sin(sine / 2)), 0), asdfw)
		end
	end
end
function rswait(value)
	game:GetService("RunService").Heartbeat:wait()
end
if char:FindFirstChild("MusicRuin") then
	char:FindFirstChild("MusicRuin"):Destroy()
end
function musik(id)
	if id == "Stop" then
		if not char:FindFirstChild("MusicRuin") then
			soundz = Instance.new("Sound", char)
		end
		if char:FindFirstChild("MusicRuin") then
			soundz = char:FindFirstChild("MusicRuin")
			soundz:Stop()
		end
	else
		if not char:FindFirstChild("MusicRuin") then
			soundz = Instance.new("Sound", char)
			for i = 1, 1 do
				local equalizer = Instance.new("EqualizerSoundEffect", soundz)
				equalizer.HighGain = 2
				equalizer.MidGain = 0
				equalizer.LowGain = 4
			end
		end
		if char:FindFirstChild("MusicRuin") then
			soundz = char:FindFirstChild("MusicRuin")
		end
		soundz.Volume = 10
		soundz.Name = "MusicRuin"
		soundz.Looped = true
		soundz.PlaybackSpeed = 1
		soundz.SoundId = "rbxassetid://" .. id
		soundz:Stop()
		soundz:Play()
	end
end


function music(id)
	currentmusic = id
	musik(id)
	--remote:FireServer("musik", id)
end
function lerp(a, b, t)
	return a + (b - a) * t
end
function Lerp(c1, c2, al)
	local com1 = {
		c1.X,
		c1.Y,
		c1.Z,
		c1:toEulerAnglesXYZ()
	}
	local com2 = {
		c2.X,
		c2.Y,
		c2.Z,
		c2:toEulerAnglesXYZ()
	}
	for i, v in pairs(com1) do
		com1[i] = v + (com2[i] - v) * al
	end
	return CFrame.new(com1[1], com1[2], com1[3]) * CFrame.Angles(select(4, unpack(com1)))
end
function slerp(a, b, t)
	dot = a:Dot(b)
	if dot > 0.99999 or dot < -0.99999 then
		return t <= 0.5 and a or b
	else
		r = math.acos(dot)
		return (a * math.sin((1 - t) * r) + b * math.sin(t * r)) / math.sin(r)
	end
end
function clerp(c1, c2, al)
	local com1 = {
		c1.X,
		c1.Y,
		c1.Z,
		c1:toEulerAnglesXYZ()
	}
	local com2 = {
		c2.X,
		c2.Y,
		c2.Z,
		c2:toEulerAnglesXYZ()
	}
	for i, v in pairs(com1) do
		com1[i] = lerp(v, com2[i], al)
	end
	return CFrame.new(com1[1], com1[2], com1[3]) * CFrame.Angles(select(4, unpack(com1)))
end
function findAllNearestTorso(pos, dist)
	local list = workspace:GetDescendants()
	local torso = {}
	local temp, human, temp2
	for x = 1, #list do
		temp2 = list[x]
		if temp2.className == "Model" and temp2 ~= char then
			temp = temp2:findFirstChild("Head")
			human = temp2:findFirstChildOfClass("Humanoid")
			if temp ~= nil and human ~= nil and human.Health > 0 and dist > (temp.Position - pos).magnitude then
				table.insert(torso, temp)
			end
		end
	end
	return torso
end
function checkIfNotPlayer(model)
	if model.CanCollide == true and model ~= char and model.Parent ~= char and model.Parent.Parent ~= char and model.Parent.Parent ~= char and model.Parent ~= DebrisModel and model.Parent.Parent ~= DebrisModel and model.Parent.Parent.Parent ~= DebrisModel and model ~= wings and model.Parent ~= wings and model.Parent.Parent ~= wings then
		return true
	else
		return false
	end
end
function newWeld(wp0, wp1, wc0x, wc0y, wc0z)
	local wld = Instance.new("Weld", wp1)
	wld.Part0 = wp0
	wld.Part1 = wp1
	wld.C0 = CFrame.new(wc0x, wc0y, wc0z)
	return wld
end
function weld(model)
	local parts, last = {}, nil
	local function scan(parent)
		for _, v in pairs(parent:GetChildren()) do
			if v:IsA("BasePart") then
				if last then
					local w = Instance.new("Weld")
					w.Name = ("%s_Weld"):format(v.Name)
					w.Part0, w.Part1 = last, v
					w.C0 = last.CFrame:inverse()
					w.C1 = v.CFrame:inverse()
					w.Parent = last
				end
				last = v
				table.insert(parts, v)
			end
			scan(v)
		end
	end
	scan(model)
	for _, v in pairs(parts) do
		v.Anchored = false
		v.Locked = true
		v.Anchored = false
		v.BackSurface = Enum.SurfaceType.SmoothNoOutlines
		v.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
		v.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
		v.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
		v.RightSurface = Enum.SurfaceType.SmoothNoOutlines
		v.TopSurface = Enum.SurfaceType.SmoothNoOutlines
		v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
		v.Massless = true
	end
end
function calculate(part, asd)
	local Head = hed
	local RightShoulder = asd
	local RightArm = part
	local MousePosition = mouse.Hit.p
	local ToMouse = (MousePosition - Head.Position).unit
	local Angle = math.acos(ToMouse:Dot(Vector3.new(0, 1, 0)))
	local FromRightArmPos = Head.Position + Head.CFrame:vectorToWorldSpace(Vector3.new(Head.Size.X / 2 + RightArm.Size.X / 2, Head.Size.Y / 2 - RightArm.Size.Z / 2, 0))
	local ToMouseRightArm = (MousePosition - FromRightArmPos) * Vector3.new(1, 0, 1).unit
	local Look = (Head.CFrame.lookVector * Vector3.new(1, 0, 1)).unit
	local LateralAngle = math.acos(ToMouseRightArm:Dot(Look))
	if tostring(LateralAngle) == "-1.#IND" then
		LateralAngle = 0
	end
	local Cross = Head.CFrame.lookVector:Cross(ToMouseRightArm)
	if LateralAngle > math.pi / 2 then
		LateralAngle = math.pi / 2
		local Torso = root
		local Point = Torso.CFrame:vectorToObjectSpace(mouse.Hit.p - Torso.CFrame.p)
		if 0 < Point.Z then
			if 0 < Point.X and RightArm == rarm then
				Torso.CFrame = CFrame.new(Torso.Position, Vector3.new(mouse.Hit.X, Torso.Position.Y, mouse.Hit.Z)) * CFrame.Angles(0, rad(110), 0)
			elseif 0 > Point.X and RightArm == rarm then
				Torso.CFrame = CFrame.new(Torso.Position, Vector3.new(mouse.Hit.X, Torso.Position.Y, mouse.Hit.Z)) * CFrame.Angles(0, rad(-110), 0)
			end
		end
	end
	if 0 > Cross.Y then
		LateralAngle = -LateralAngle
	end
	return (CFrame.Angles(math.pi / 2 - Angle, math.pi / 2 + LateralAngle, math.pi / 2))
end
function sond(id, position, vol, pitch, distance, start, finish)
	local sound
	coroutine.resume(coroutine.create(function()
		local part = Instance.new("Part", workspace)
		part.Position = position
		part.Size = Vector3.new(0, 0, 0)
		part.CanCollide = false
		part.Transparency = 1
		part.Anchored = true
		sound = Instance.new("Sound", part)
		sound.SoundId = "rbxassetid://" .. id
		repeat
			rs:wait()
		until sound.IsLoaded
		if vol ~= nil then
			sound.Volume = vol
		end
		if pitch ~= nil then
			sound.PlaybackSpeed = pitch
		end
		if distance ~= nil then
			sound.EmitterSize = distance
		end
		if start ~= nil then
			sound.TimePosition = start
		end
		if finish ~= nil then
			debris:AddItem(part, finish - start)
		else
			debris:AddItem(part, sound.TimeLength)
		end
		sound:Play()
	end))
	return sound
end

function sound(id, position, vol, pitch, distance, start, finish)
	local part = sond(id, position, vol, pitch, distance, start, finish)
	--remote:FireServer("sond", id, position, vol, pitch, distance, start, finish)
	return part
end
function computeDirection(vec)
	local lenSquared = vec.magnitude * vec.magnitude
	local invSqrt = 1 / math.sqrt(lenSquared)
	return Vector3.new(vec.x * invSqrt, vec.y * invSqrt, vec.z * invSqrt)
end
local shaking = 0
function shake(num)
	if num > shaking then
		shaking = num
	end
end
game:GetService("RunService").RenderStepped:connect(function()
	--hum.CameraOffset = Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1)) * (shaking / 100)
	if shaking > 0 then
		shaking = shaking - 1
	else
		shaking = 0
	end
end)
plr = p
DebrisModel = Instance.new("Model", plr.Character)
DebrisModel.Name = "DebrisModel"
function Effekt(mesh, size, transparency, material, color, position, rotation, positionchange, sizechange, rotationchange, transparencychange, acceleration)
	local part = Instance.new("Part", DebrisModel)
	part.Anchored = true
	part.CanCollide = false
	part.Size = Vector3.new(1, 1, 1)
	part.Transparency = transparency
	part.Material = material
	part.Color = color
	part.CFrame = CFrame.new(position) * CFrame.Angles(rad(rotation.X), rad(rotation.Y), rad(rotation.Z))
	local partmesh = Instance.new("SpecialMesh", part)
	if tonumber(mesh) == nil then
		partmesh.MeshType = mesh
	else
		partmesh.MeshId = "rbxassetid://" .. mesh
	end
	partmesh.Scale = size
	local pvalue = Instance.new("Vector3Value", part)
	pvalue.Name = "Position"
	pvalue.Value = positionchange
	local svalue = Instance.new("Vector3Value", part)
	svalue.Name = "Size"
	svalue.Value = sizechange
	local rvalue = Instance.new("Vector3Value", part)
	rvalue.Name = "Rotation"
	rvalue.Value = rotationchange
	local tvalue = Instance.new("NumberValue", part)
	tvalue.Name = "Transparency"
	tvalue.Value = transparencychange
	local avalue = Instance.new("NumberValue", part)
	avalue.Name = "Acceleration"
	avalue.Value = acceleration
	part.Name = "EFFECT"
	return part
end

function Effect(mesh, size, transparency, material, color, position, rotation, positionchange, sizechange, rotationchange, transparencychange, acceleration)
	if plr == lplr then
		return part
	end
end
function CEffekt(mesh, size, transparency, material, color, cframe, positionchange, sizechange, rotationchange, transparencychange, acceleration)
	local part = Instance.new("Part", DebrisModel)
	part.Anchored = true
	part.CanCollide = false
	part.Size = Vector3.new(1, 1, 1)
	part.Transparency = transparency
	part.Material = material
	part.Color = color
	part.CFrame = cframe
	local partmesh = Instance.new("SpecialMesh", part)
	if tonumber(mesh) == nil then
		partmesh.MeshType = mesh
	else
		partmesh.MeshId = "rbxassetid://" .. mesh
	end
	partmesh.Scale = size
	local pvalue = Instance.new("Vector3Value", part)
	pvalue.Name = "Position"
	pvalue.Value = positionchange
	local svalue = Instance.new("Vector3Value", part)
	svalue.Name = "Size"
	svalue.Value = sizechange
	local rvalue = Instance.new("Vector3Value", part)
	rvalue.Name = "Rotation"
	rvalue.Value = rotationchange
	local tvalue = Instance.new("NumberValue", part)
	tvalue.Name = "Transparency"
	tvalue.Value = transparencychange
	local avalue = Instance.new("NumberValue", part)
	avalue.Name = "Acceleration"
	avalue.Value = acceleration
	part.Name = "EFFECT"
	return part
end

function CEffect(mesh, size, transparency, material, color, cframe, positionchange, sizechange, rotationchange, transparencychange, acceleration)
	if plr == lplr then
		local part = CEffekt(mesh, size, transparency, material, color, cframe, positionchange, sizechange, rotationchange, transparencychange, acceleration)
		return part
	end
end
game:GetService("RunService").Heartbeat:Connect(function()
	coroutine.resume(coroutine.create(function()
		for i, v in pairs(DebrisModel:GetChildren()) do
			if v:isA("BasePart") then
				v.LocalTransparencyModifier = 0
			end
		end
		if not workspace:FindFirstChild("DebrisModel") then
			DebrisModel = Instance.new("Model", workspace)
			DebrisModel.Name = "DebrisModel"
		end
		for i, v in pairs(DebrisModel:GetChildren()) do
			if v:IsA("BasePart") and v.Name == "EFFECT" then
				local pvalue = v:FindFirstChild("Position").Value
				local svalue = v:FindFirstChild("Size").Value
				local rvalue = v:FindFirstChild("Rotation").Value
				local tvalue = v:FindFirstChild("Transparency").Value
				local avalue = v:FindFirstChild("Acceleration").Value
				local mesh = v:FindFirstChild("Mesh")
				mesh.Scale = mesh.Scale + svalue
				v:FindFirstChild("Size").Value = v:FindFirstChild("Size").Value + Vector3.new(1, 1, 1) * avalue
				v.Transparency = v.Transparency + tvalue
				v.CFrame = CFrame.new(pvalue) * v.CFrame * CFrame.Angles(rad(rvalue.X), rad(rvalue.Y), rad(rvalue.Z))
				if v.Transparency >= 1 or 0 > mesh.Scale.X or 0 > mesh.Scale.Y or 0 > mesh.Scale.Z then
					v:Destroy()
				end
			end
		end
	end))
end)
function litnin(Part0, Part1, Times, Offset, Color, Thickness, Trans)
	local magz = (Part0 - Part1).magnitude
	local curpos = Part0
	local trz = {
		-Offset,
		Offset
	}
	for i = 1, Times do
		local li = Instance.new("Part", DebrisModel)
		li.TopSurface = 0
		li.Material = Enum.Material.Neon
		li.BottomSurface = 0
		li.Anchored = true
		li.Locked = true
		li.Transparency = Trans or 0.4
		li.Color = Color
		li.formFactor = "Custom"
		li.CanCollide = false
		li.Size = Vector3.new(Thickness, Thickness, magz / Times)
		local lim = Instance.new("BlockMesh", li)
		local Offzet = Vector3.new(trz[math.random(1, 2)], trz[math.random(1, 2)], trz[math.random(1, 2)])
		local trolpos = CFrame.new(curpos, Part1) * CFrame.new(0, 0, magz / Times).p + Offzet
		if Times == i then
			local magz2 = (curpos - Part1).magnitude
			li.Size = Vector3.new(Thickness, Thickness, magz2)
			li.CFrame = CFrame.new(curpos, Part1) * CFrame.new(0, 0, -magz2 / 2)
		else
			li.CFrame = CFrame.new(curpos, trolpos) * CFrame.new(0, 0, magz / Times / 2)
		end
		curpos = li.CFrame * CFrame.new(0, 0, magz / Times / 2).p
		li.Name = "LIGHTNING"
	end
end

function Lightning(Part0, Part1, Times, Offset, Color, Thickness, Trans)
	local part = litnin(Part0, Part1, Times, Offset, Color, Thickness, Trans)
	--remote:FireServer("litnin", Part0, Part1, Times, Offset, Color, Thickness, Trans)
end
function createimpakt(a, b, c, d, endPoint, ori)
	coroutine.resume(coroutine.create(function()
		local temppart = Instance.new("Part", DebrisModel)
		for i = 1, 8 do
			local bullet = Instance.new("Part", workspace)
			bullet.Material = a
			bullet.Color = b
			bullet.TopSurface = c
			bullet.BottomSurface = d
			bullet.Size = Vector3.new(10, 10, 10)
			bullet.CFrame = root.CFrame
			bullet.CanCollide = false
			bullet.Velocity = Vector3.new(math.random(-80, 80), 120, math.random(-80, 80))
			bullet.RotVelocity = Vector3.new(math.random(-80, 80), math.random(-80, 80), math.random(-80, 80)) / 10
			bullet:BreakJoints()
			debris:AddItem(bullet, 5)
		end
		for z = 1, 2 do
			for i = 1, 40 do
				temppart.CFrame = CFrame.new(endPoint, endPoint + Vector3.new(1, 0, 0)) * CFrame.Angles(rad(ori.X), rad(ori.Y), rad(ori.Z)) * CFrame.Angles(0, rad(i / 40 * 360), 0) * CFrame.new(0, math.random(-10, -5) + z * 5, math.random(-5, 5) - (10 + z * 10))
				local bullet = Instance.new("Part", workspace)
				bullet.Material = a
				bullet.Anchored = true
				bullet.CanCollide = false
				bullet.Color = b
				bullet.TopSurface = c
				bullet.BottomSurface = d
				bullet.Size = Vector3.new(10, 15, 20)
				bullet.CFrame = CFrame.new(temppart.Position + Vector3.new(0, -10, 0), endPoint + Vector3.new(0, -1, 0))
				debris:AddItem(bullet, 5)
			end
		end
		temppart:Destroy()
	end))
end

function createimpact()
	coroutine.resume(coroutine.create(function()
		local ray = Ray.new(root.Position, Vector3.new(0, -1000, 0))
		local part, endPoint = workspace:FindPartOnRay(ray, char)
		createimpakt(part.Material, part.Color, part.TopSurface, part.BottomSurface, endPoint, part.Orientation)
		--remote:FireServer("impakt", part.Material, part.Color, part.TopSurface, part.BottomSurface, endPoint, part.Orientation)
	end))
end
function projectile(pos, target, size, speed, color, doing, onexplosion)
	local Part0 = Instance.new("Part", DebrisModel)
	local SpecialMesh1 = Instance.new("SpecialMesh")
	Part0.Material = Enum.Material.Neon
	Part0.Anchored = false
	Part0.Size = Vector3.new(1, 1, 1)
	Part0.CFrame = CFrame.new(-57, 5, 28, 0.99999994, 0, 0, 0, 1, -5.56362707E-8, 0, 5.56362707E-8, 1)
	Part0.BottomSurface = Enum.SurfaceType.Smooth
	Part0.TopSurface = Enum.SurfaceType.Smooth
	Part0.Position = Vector3.new(-57, 5, 28)
	Part0.Color = Color3.new(1, 1, 1)
	Part0.CanCollide = false
	Part0.Transparency = 1
	local bforce = Instance.new("BodyForce", Part0)
	bforce.force = Vector3.new(0, bforce.Parent:getMass() * workspace.Gravity, 0)
	SpecialMesh1.Parent = Part0
	SpecialMesh1.MeshType = Enum.MeshType.Sphere
	SpecialMesh1.Scale = Vector3.new(1, 1, 1) * size
	local Position = pos
	local Target = target
	local direction = Target - Position
	local direction = computeDirection(direction)
	local pos = Position + direction * 2
	Part0.CFrame = CFrame.new(pos, pos + direction) * CFrame.Angles(math.pi / 2 + rad(90), 0, 0)
	Part0.Velocity = direction * speed
	root.Velocity = root.Velocity + -direction * 5
	local color2 = color
	local loop = rs:connect(function()
		if plr == lplr then
			doing(Part0.Position, color, speed, size)
		end
	end)
	local function stop()
		loop:disconnect()
		Part0:Destroy()
	end
	delay(10, function()
		stop()
	end)
	local asd
	asd = Part0.Touched:Connect(function(ht)
		if checkIfNotPlayer(ht) == true and ht.CanCollide == true then
			if plr == lplr then
				onexplosion(Part0.Position, color, speed, size)
				for i, v in pairs(findAllNearestTorso(Part0.Position, 10 * size)) do
					local hit = v.Parent
					if hit:FindFirstChildOfClass("Humanoid") then
						local hum = hit:FindFirstChildOfClass("Humanoid")
						if hum.MaxHealth > 1.0E100 then
							--remote:FireServer("breakjoints", v.Parent)
						else
							--remote:FireServer("damage", hum, hum.MaxHealth / math.random(5, 6) * (size / 2))
						end
					end
				end
			end
			stop()
			asd:disconnect()
		end
	end)
end
function partchange(target, material, color)
	for i, v in pairs(target:children()) do
		if v:IsA("BasePart") then
			v.Color = color
			v.Material = material
		end
	end
end
max = 0
velocityYFall = 0
velocityYFall2 = 0
velocityYFall3 = 0
velocityYFall4 = 0
neckrotY = 0
neckrotY2 = 0
torsorotY = 0
torsorotY2 = 0
torsoY = 0
torsoY2 = 0
sine = 0
change = 1
movement = 20
hum.WalkSpeed = 50
timeranim = 0
running = false
jumped = false
icolor = 1
imode = false
didjump = false
jumppower = 0
debounceimpact = false
noidlew = false
drew = false
sidestep = 0
local size = 1
local ranonce = true
if not larm:FindFirstChild("Weld") then
	newWeld(torso, larm, -1.5, 0.5, 0)
	ranonce = false
end
if not rarm:FindFirstChild("Weld") then
	newWeld(torso, rarm, 1.5, 0.5, 0)
	ranonce = false
end
if not lleg:FindFirstChild("Weld") then
	newWeld(torso, lleg, -0.5, -1, 0)
	ranonce = false
end
if not rleg:FindFirstChild("Weld") then
	newWeld(torso, rleg, 0.5, -1, 0)
	ranonce = false
end
if not torso:FindFirstChild("Weld") then
	newWeld(root, torso, 0, -1, 0)
	ranonce = false
end
if not hed:FindFirstChild("Weld") then
	newWeld(torso, hed, 0, 1.5, 0)
	ranonce = false
end
larm.Weld.C1 = CFrame.new(0, 0.5, 0)
rarm.Weld.C1 = CFrame.new(0, 0.5, 0)
lleg.Weld.C1 = CFrame.new(0, 1, 0)
rleg.Weld.C1 = CFrame.new(0, 1, 0)
torso.Weld.C1 = CFrame.new(0, -1, 0)
if ranonce then
	for i, v in pairs(char:GetChildren()) do
		if v ~= DebrisModel and v:IsA("Model") then
			v:Destroy()
		end
	end
end
skin_custom = false
skin_color = BrickColor.new("Light orange")
custom_outfits = false
hum.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
music("Stop")
for i, v in pairs(char:GetChildren()) do
	if v.Name:lower():find(("headphone"):lower()) or v.Name:lower():find(("wing"):lower()) then
		v:Destroy()
	end
end
if torso:FindFirstChildOfClass("PointLight") then
	torso:FindFirstChildOfClass("PointLight"):Destroy()
end
Model0 = Instance.new("Model")
Part1 = Instance.new("Part")
Model2 = Instance.new("Model")
Part3 = Instance.new("Part")
SpecialMesh4 = Instance.new("SpecialMesh")
Part5 = Instance.new("Part")
SpecialMesh6 = Instance.new("SpecialMesh")
Part7 = Instance.new("Part")
SpecialMesh8 = Instance.new("SpecialMesh")
Part9 = Instance.new("Part")
SpecialMesh10 = Instance.new("SpecialMesh")
Part11 = Instance.new("Part")
SpecialMesh12 = Instance.new("SpecialMesh")
Model13 = Instance.new("Model")
Part14 = Instance.new("Part")
Part15 = Instance.new("Part")
Part16 = Instance.new("Part")
SpecialMesh17 = Instance.new("SpecialMesh")
Part18 = Instance.new("Part")
SpecialMesh19 = Instance.new("SpecialMesh")
Part20 = Instance.new("Part")
SpecialMesh21 = Instance.new("SpecialMesh")
Part22 = Instance.new("Part")
SpecialMesh23 = Instance.new("SpecialMesh")
Part24 = Instance.new("Part")
SpecialMesh25 = Instance.new("SpecialMesh")
Part26 = Instance.new("Part")
SpecialMesh27 = Instance.new("SpecialMesh")
Part28 = Instance.new("Part")
SpecialMesh29 = Instance.new("SpecialMesh")
Part30 = Instance.new("Part")
SpecialMesh31 = Instance.new("SpecialMesh")
Part32 = Instance.new("Part")
SpecialMesh33 = Instance.new("SpecialMesh")
Part34 = Instance.new("Part")
SpecialMesh35 = Instance.new("SpecialMesh")
Part36 = Instance.new("Part")
SpecialMesh37 = Instance.new("SpecialMesh")
Part38 = Instance.new("Part")
SpecialMesh39 = Instance.new("SpecialMesh")
Model0.Parent = char
Part1.Name = "asd"
Part1.Parent = Model0
Part1.Anchored = true
Part1.CanCollide = false
Part1.Size = Vector3.new(0.110000007, 0.110000007, 0.110000007)
Part1.CFrame = CFrame.new(-27.8999939, 13.9920015, 32.0999947, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part1.BottomSurface = Enum.SurfaceType.Smooth
Part1.TopSurface = Enum.SurfaceType.Smooth
Part1.Position = Vector3.new(-27.8999939, 13.9920015, 32.0999947)
Model2.Name = "b"
Model2.Parent = Model0
Part3.Parent = Model2
Part3.Material = Enum.Material.Neon
Part3.Anchored = true
Part3.CanCollide = false
Part3.Size = Vector3.new(1.66100013, 0.418000013, 0.418000013)
Part3.CFrame = CFrame.new(-27.8999939, 14.0690012, 32.0999947, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part3.BottomSurface = Enum.SurfaceType.Smooth
Part3.TopSurface = Enum.SurfaceType.Smooth
Part3.Position = Vector3.new(-27.8999939, 14.0690012, 32.0999947)
Part3.Color = Color3.new(0, 1, 0)
SpecialMesh4.Parent = Part3
SpecialMesh4.MeshType = Enum.MeshType.Cylinder
Part5.Parent = Model2
Part5.Rotation = Vector3.new(90, 75, -90)
Part5.Anchored = true
Part5.CanCollide = false
Part5.Size = Vector3.new(0.0500000566, 0.389999986, 0.190000027)
Part5.CFrame = CFrame.new(-27.4930534, 14.9197569, 32.045002, -2.14088644E-7, 0.258819014, 0.965925813, 3.39400188E-8, 0.965925753, -0.258819044, -1, -2.26266774E-8, -2.15578069E-7)
Part5.BottomSurface = Enum.SurfaceType.Smooth
Part5.TopSurface = Enum.SurfaceType.Smooth
Part5.Position = Vector3.new(-27.4930534, 14.9197569, 32.045002)
Part5.Color = Color3.new(0, 1, 0)
SpecialMesh6.Parent = Part5
SpecialMesh6.MeshType = Enum.MeshType.Wedge
Part7.Parent = Model2
Part7.Rotation = Vector3.new(-90, 75, 90)
Part7.Anchored = true
Part7.CanCollide = false
Part7.Size = Vector3.new(0.0500000566, 0.389999986, 0.190000027)
Part7.CFrame = CFrame.new(-28.4904671, 14.8705807, 32.045002, -2.14088658E-7, -0.258818805, 0.965925872, -3.39399904E-8, 0.965925813, 0.258818835, -1, 2.26266579E-8, -2.15578069E-7)
Part7.BottomSurface = Enum.SurfaceType.Smooth
Part7.TopSurface = Enum.SurfaceType.Smooth
Part7.Position = Vector3.new(-28.4904671, 14.8705807, 32.045002)
Part7.Color = Color3.new(0, 1, 0)
SpecialMesh8.Parent = Part7
SpecialMesh8.MeshType = Enum.MeshType.Wedge
Part9.Parent = Model2
Part9.Rotation = Vector3.new(-90, -75, -90)
Part9.Anchored = true
Part9.CanCollide = false
Part9.Size = Vector3.new(0.0500000566, 0.389999986, 0.190000027)
Part9.CFrame = CFrame.new(-27.3095264, 14.8705807, 32.045002, 1.29644732E-7, 0.258819014, -0.965925813, -1.13133396E-8, 0.965925753, 0.258819044, 1, -2.26266774E-8, 1.28155307E-7)
Part9.BottomSurface = Enum.SurfaceType.Smooth
Part9.TopSurface = Enum.SurfaceType.Smooth
Part9.Position = Vector3.new(-27.3095264, 14.8705807, 32.045002)
Part9.Color = Color3.new(0, 1, 0)
SpecialMesh10.Parent = Part9
SpecialMesh10.MeshType = Enum.MeshType.Wedge
Part11.Parent = Model2
Part11.Rotation = Vector3.new(90, -75, 90)
Part11.Anchored = true
Part11.CanCollide = false
Part11.Size = Vector3.new(0.0500000566, 0.389999986, 0.190000027)
Part11.CFrame = CFrame.new(-28.3069401, 14.9197569, 32.045002, 1.29644732E-7, -0.258818805, -0.965925872, 1.13133307E-8, 0.965925813, -0.258818835, 1, 2.26266579E-8, 1.28155307E-7)
Part11.BottomSurface = Enum.SurfaceType.Smooth
Part11.TopSurface = Enum.SurfaceType.Smooth
Part11.Position = Vector3.new(-28.3069401, 14.9197569, 32.045002)
Part11.Color = Color3.new(0, 1, 0)
SpecialMesh12.Parent = Part11
SpecialMesh12.MeshType = Enum.MeshType.Wedge
Model13.Name = "a"
Model13.Parent = Model0
Part14.Parent = Model13
Part14.Material = Enum.Material.SmoothPlastic
Part14.Anchored = true
Part14.CanCollide = false
Part14.Size = Vector3.new(1.4519999, 0.42900002, 0.220000058)
Part14.CFrame = CFrame.new(-27.8999939, 14.2505007, 32.0999947, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part14.BottomSurface = Enum.SurfaceType.Smooth
Part14.TopSurface = Enum.SurfaceType.Smooth
Part14.Position = Vector3.new(-27.8999939, 14.2505007, 32.0999947)
Part14.Color = Color3.new(0.2, 0.2, 0.2)
Part15.Parent = Model13
Part15.Material = Enum.Material.SmoothPlastic
Part15.Anchored = true
Part15.CanCollide = false
Part15.Size = Vector3.new(0.923999846, 0.38500008, 0.220000058)
Part15.CFrame = CFrame.new(-27.8999939, 14.5585003, 32.0999947, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part15.BottomSurface = Enum.SurfaceType.Smooth
Part15.TopSurface = Enum.SurfaceType.Smooth
Part15.Position = Vector3.new(-27.8999939, 14.5585003, 32.0999947)
Part15.Color = Color3.new(0.2, 0.2, 0.2)
Part16.Parent = Model13
Part16.Material = Enum.Material.SmoothPlastic
Part16.Rotation = Vector3.new(0, -90, 0)
Part16.Anchored = true
Part16.CanCollide = false
Part16.Size = Vector3.new(0.220000014, 0.561000109, 0.715000033)
Part16.CFrame = CFrame.new(-28.3454952, 14.4705009, 32.0999947, 1.31134158E-7, 0, -1, 0, 0.99999994, 0, 1, 0, 1.31134158E-7)
Part16.BottomSurface = Enum.SurfaceType.Smooth
Part16.TopSurface = Enum.SurfaceType.Smooth
Part16.Position = Vector3.new(-28.3454952, 14.4705009, 32.0999947)
Part16.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh17.Parent = Part16
SpecialMesh17.MeshType = Enum.MeshType.Cylinder
Part18.Parent = Model13
Part18.Material = Enum.Material.SmoothPlastic
Part18.Rotation = Vector3.new(0, 90, 0)
Part18.Anchored = true
Part18.CanCollide = false
Part18.Size = Vector3.new(0.220000014, 0.561000109, 0.715000033)
Part18.CFrame = CFrame.new(-27.4544926, 14.4705009, 32.0999947, -4.37113883E-8, 0, 1, 0, 0.99999994, 0, -1, 0, -4.37113883E-8)
Part18.BottomSurface = Enum.SurfaceType.Smooth
Part18.TopSurface = Enum.SurfaceType.Smooth
Part18.Position = Vector3.new(-27.4544926, 14.4705009, 32.0999947)
Part18.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh19.Parent = Part18
SpecialMesh19.MeshType = Enum.MeshType.Cylinder
Part20.Parent = Model13
Part20.Material = Enum.Material.SmoothPlastic
Part20.Anchored = true
Part20.CanCollide = false
Part20.Size = Vector3.new(1.67200005, 0.395999998, 0.395999998)
Part20.CFrame = CFrame.new(-27.8999939, 14.0690012, 32.0999947, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part20.BottomSurface = Enum.SurfaceType.Smooth
Part20.TopSurface = Enum.SurfaceType.Smooth
Part20.Position = Vector3.new(-27.8999939, 14.0690012, 32.0999947)
Part20.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh21.Parent = Part20
SpecialMesh21.MeshType = Enum.MeshType.Cylinder
Part22.Parent = Model13
Part22.Material = Enum.Material.SmoothPlastic
Part22.Anchored = true
Part22.CanCollide = false
Part22.Size = Vector3.new(1.6500001, 0.440000027, 0.440000027)
Part22.CFrame = CFrame.new(-27.8999939, 14.0690012, 32.0999947, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part22.BottomSurface = Enum.SurfaceType.Smooth
Part22.TopSurface = Enum.SurfaceType.Smooth
Part22.Position = Vector3.new(-27.8999939, 14.0690012, 32.0999947)
Part22.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh23.Parent = Part22
SpecialMesh23.MeshType = Enum.MeshType.Cylinder
Part24.Parent = Model13
Part24.Rotation = Vector3.new(-90, 75, 90)
Part24.Anchored = true
Part24.CanCollide = false
Part24.Size = Vector3.new(0.170000046, 0.399999976, 0.200000033)
Part24.CFrame = CFrame.new(-28.4965916, 14.8741169, 32.1150055, -2.14088658E-7, -0.258818805, 0.965925872, -3.39399904E-8, 0.965925813, 0.258818835, -1, 2.26266579E-8, -2.15578069E-7)
Part24.BottomSurface = Enum.SurfaceType.Smooth
Part24.TopSurface = Enum.SurfaceType.Smooth
Part24.Position = Vector3.new(-28.4965916, 14.8741169, 32.1150055)
Part24.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh25.Parent = Part24
SpecialMesh25.MeshType = Enum.MeshType.Wedge
Part26.Parent = Model13
Part26.Rotation = Vector3.new(90, -75, 90)
Part26.Anchored = true
Part26.CanCollide = false
Part26.Size = Vector3.new(0.170000046, 0.399999976, 0.200000033)
Part26.CFrame = CFrame.new(-28.3034039, 14.9258804, 32.1150055, 1.29644732E-7, -0.258818805, -0.965925872, 1.13133307E-8, 0.965925813, -0.258818835, 1, 2.26266579E-8, 1.28155307E-7)
Part26.BottomSurface = Enum.SurfaceType.Smooth
Part26.TopSurface = Enum.SurfaceType.Smooth
Part26.Position = Vector3.new(-28.3034039, 14.9258804, 32.1150055)
Part26.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh27.Parent = Part26
SpecialMesh27.MeshType = Enum.MeshType.Wedge
Part28.Parent = Model13
Part28.Rotation = Vector3.new(-90, -75, -90)
Part28.Anchored = true
Part28.CanCollide = false
Part28.Size = Vector3.new(0.170000046, 0.399999976, 0.200000033)
Part28.CFrame = CFrame.new(-27.3034019, 14.8741169, 32.1150055, 1.29644732E-7, 0.258819014, -0.965925813, -1.13133396E-8, 0.965925753, 0.258819044, 1, -2.26266774E-8, 1.28155307E-7)
Part28.BottomSurface = Enum.SurfaceType.Smooth
Part28.TopSurface = Enum.SurfaceType.Smooth
Part28.Position = Vector3.new(-27.3034019, 14.8741169, 32.1150055)
Part28.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh29.Parent = Part28
SpecialMesh29.MeshType = Enum.MeshType.Wedge
Part30.Parent = Model13
Part30.Rotation = Vector3.new(90, 75, -90)
Part30.Anchored = true
Part30.CanCollide = false
Part30.Size = Vector3.new(0.170000046, 0.399999976, 0.200000033)
Part30.CFrame = CFrame.new(-27.4965897, 14.9258804, 32.1150055, -2.14088644E-7, 0.258819014, 0.965925813, 3.39400188E-8, 0.965925753, -0.258819044, -1, -2.26266774E-8, -2.15578069E-7)
Part30.BottomSurface = Enum.SurfaceType.Smooth
Part30.TopSurface = Enum.SurfaceType.Smooth
Part30.Position = Vector3.new(-27.4965897, 14.9258804, 32.1150055)
Part30.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh31.Parent = Part30
SpecialMesh31.MeshType = Enum.MeshType.Wedge
Part32.Parent = Model13
Part32.Rotation = Vector3.new(-90, -75, -90)
Part32.Anchored = true
Part32.CanCollide = false
Part32.Size = Vector3.new(0.0600000545, 0.379999995, 0.180000022)
Part32.CFrame = CFrame.new(-27.315649, 14.8670454, 32.0400009, 1.29644732E-7, 0.258819014, -0.965925813, -1.13133396E-8, 0.965925753, 0.258819044, 1, -2.26266774E-8, 1.28155307E-7)
Part32.BottomSurface = Enum.SurfaceType.Smooth
Part32.TopSurface = Enum.SurfaceType.Smooth
Part32.Position = Vector3.new(-27.315649, 14.8670454, 32.0400009)
Part32.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh33.Parent = Part32
SpecialMesh33.MeshType = Enum.MeshType.Wedge
Part34.Parent = Model13
Part34.Rotation = Vector3.new(90, 75, -90)
Part34.Anchored = true
Part34.CanCollide = false
Part34.Size = Vector3.new(0.0600000545, 0.379999995, 0.180000022)
Part34.CFrame = CFrame.new(-27.4895191, 14.9136333, 32.0400009, -2.14088644E-7, 0.258819014, 0.965925813, 3.39400188E-8, 0.965925753, -0.258819044, -1, -2.26266774E-8, -2.15578069E-7)
Part34.BottomSurface = Enum.SurfaceType.Smooth
Part34.TopSurface = Enum.SurfaceType.Smooth
Part34.Position = Vector3.new(-27.4895191, 14.9136333, 32.0400009)
Part34.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh35.Parent = Part34
SpecialMesh35.MeshType = Enum.MeshType.Wedge
Part36.Parent = Model13
Part36.Rotation = Vector3.new(-90, 75, 90)
Part36.Anchored = true
Part36.CanCollide = false
Part36.Size = Vector3.new(0.0600000545, 0.379999995, 0.180000022)
Part36.CFrame = CFrame.new(-28.4843445, 14.8670454, 32.0400009, -2.14088658E-7, -0.258818805, 0.965925872, -3.39399904E-8, 0.965925813, 0.258818835, -1, 2.26266579E-8, -2.15578069E-7)
Part36.BottomSurface = Enum.SurfaceType.Smooth
Part36.TopSurface = Enum.SurfaceType.Smooth
Part36.Position = Vector3.new(-28.4843445, 14.8670454, 32.0400009)
Part36.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh37.Parent = Part36
SpecialMesh37.MeshType = Enum.MeshType.Wedge
Part38.Parent = Model13
Part38.Rotation = Vector3.new(90, -75, 90)
Part38.Anchored = true
Part38.CanCollide = false
Part38.Size = Vector3.new(0.0600000545, 0.379999995, 0.180000022)
Part38.CFrame = CFrame.new(-28.3104744, 14.9136333, 32.0400009, 1.29644732E-7, -0.258818805, -0.965925872, 1.13133307E-8, 0.965925813, -0.258818835, 1, 2.26266579E-8, 1.28155307E-7)
Part38.BottomSurface = Enum.SurfaceType.Smooth
Part38.TopSurface = Enum.SurfaceType.Smooth
Part38.Position = Vector3.new(-28.3104744, 14.9136333, 32.0400009)
Part38.Color = Color3.new(0.2, 0.2, 0.2)
SpecialMesh39.Parent = Part38
SpecialMesh39.MeshType = Enum.MeshType.Wedge
headphone = Model0
headphone.Name = "headphone"
weld(headphone)
newWeld(hed, headphone.asd, 0, 0, 0)
Model0 = Instance.new("Model")
Model1 = Instance.new("Model")
Part2 = Instance.new("Part")
Part3 = Instance.new("Part")
Part4 = Instance.new("Part")
Part5 = Instance.new("Part")
Part6 = Instance.new("Part")
BlockMesh7 = Instance.new("BlockMesh")
Part8 = Instance.new("Part")
Part9 = Instance.new("Part")
Part10 = Instance.new("Part")
Part11 = Instance.new("Part")
BlockMesh12 = Instance.new("BlockMesh")
Part13 = Instance.new("Part")
BlockMesh14 = Instance.new("BlockMesh")
Part15 = Instance.new("Part")
BlockMesh16 = Instance.new("BlockMesh")
Part17 = Instance.new("Part")
BlockMesh18 = Instance.new("BlockMesh")
Part19 = Instance.new("Part")
Part20 = Instance.new("Part")
BlockMesh21 = Instance.new("BlockMesh")
Part22 = Instance.new("Part")
Part23 = Instance.new("Part")
BlockMesh24 = Instance.new("BlockMesh")
Part25 = Instance.new("Part")
BlockMesh26 = Instance.new("BlockMesh")
Part27 = Instance.new("Part")
BlockMesh28 = Instance.new("BlockMesh")
Part29 = Instance.new("Part")
BlockMesh30 = Instance.new("BlockMesh")
Part31 = Instance.new("Part")
BlockMesh32 = Instance.new("BlockMesh")
Part33 = Instance.new("Part")
BlockMesh34 = Instance.new("BlockMesh")
Part35 = Instance.new("Part")
Part36 = Instance.new("Part")
Part37 = Instance.new("Part")
Part38 = Instance.new("Part")
Part39 = Instance.new("Part")
SpecialMesh40 = Instance.new("SpecialMesh")
Part41 = Instance.new("Part")
Part42 = Instance.new("Part")
BlockMesh43 = Instance.new("BlockMesh")
Part44 = Instance.new("Part")
Part45 = Instance.new("Part")
SpecialMesh46 = Instance.new("SpecialMesh")
Part47 = Instance.new("Part")
Part48 = Instance.new("Part")
Part49 = Instance.new("Part")
SpecialMesh50 = Instance.new("SpecialMesh")
Part51 = Instance.new("Part")
SpecialMesh52 = Instance.new("SpecialMesh")
Part53 = Instance.new("Part")
BlockMesh54 = Instance.new("BlockMesh")
Part55 = Instance.new("Part")
BlockMesh56 = Instance.new("BlockMesh")
Part57 = Instance.new("Part")
BlockMesh58 = Instance.new("BlockMesh")
Part59 = Instance.new("Part")
Part60 = Instance.new("Part")
Part61 = Instance.new("Part")
SpecialMesh62 = Instance.new("SpecialMesh")
Part63 = Instance.new("Part")
SpecialMesh64 = Instance.new("SpecialMesh")
Part65 = Instance.new("Part")
Part66 = Instance.new("Part")
SpecialMesh67 = Instance.new("SpecialMesh")
Part68 = Instance.new("Part")
BlockMesh69 = Instance.new("BlockMesh")
Part70 = Instance.new("Part")
Part71 = Instance.new("Part")
Part72 = Instance.new("Part")
SpecialMesh73 = Instance.new("SpecialMesh")
Part74 = Instance.new("Part")
SpecialMesh75 = Instance.new("SpecialMesh")
Part76 = Instance.new("Part")
SpecialMesh77 = Instance.new("SpecialMesh")
Part78 = Instance.new("Part")
SpecialMesh79 = Instance.new("SpecialMesh")
Part80 = Instance.new("Part")
SpecialMesh81 = Instance.new("SpecialMesh")
Part82 = Instance.new("Part")
SpecialMesh83 = Instance.new("SpecialMesh")
Part84 = Instance.new("Part")
SpecialMesh85 = Instance.new("SpecialMesh")
Part86 = Instance.new("Part")
BlockMesh87 = Instance.new("BlockMesh")
Part88 = Instance.new("Part")
BlockMesh89 = Instance.new("BlockMesh")
Part90 = Instance.new("Part")
BlockMesh91 = Instance.new("BlockMesh")
Part92 = Instance.new("Part")
BlockMesh93 = Instance.new("BlockMesh")
WedgePart94 = Instance.new("WedgePart")
SpecialMesh95 = Instance.new("SpecialMesh")
WedgePart96 = Instance.new("WedgePart")
SpecialMesh97 = Instance.new("SpecialMesh")
WedgePart98 = Instance.new("WedgePart")
SpecialMesh99 = Instance.new("SpecialMesh")
WedgePart100 = Instance.new("WedgePart")
SpecialMesh101 = Instance.new("SpecialMesh")
WedgePart102 = Instance.new("WedgePart")
SpecialMesh103 = Instance.new("SpecialMesh")
WedgePart104 = Instance.new("WedgePart")
SpecialMesh105 = Instance.new("SpecialMesh")
WedgePart106 = Instance.new("WedgePart")
SpecialMesh107 = Instance.new("SpecialMesh")
WedgePart108 = Instance.new("WedgePart")
SpecialMesh109 = Instance.new("SpecialMesh")
WedgePart110 = Instance.new("WedgePart")
SpecialMesh111 = Instance.new("SpecialMesh")
WedgePart112 = Instance.new("WedgePart")
SpecialMesh113 = Instance.new("SpecialMesh")
WedgePart114 = Instance.new("WedgePart")
SpecialMesh115 = Instance.new("SpecialMesh")
WedgePart116 = Instance.new("WedgePart")
SpecialMesh117 = Instance.new("SpecialMesh")
WedgePart118 = Instance.new("WedgePart")
SpecialMesh119 = Instance.new("SpecialMesh")
WedgePart120 = Instance.new("WedgePart")
SpecialMesh121 = Instance.new("SpecialMesh")
WedgePart122 = Instance.new("WedgePart")
SpecialMesh123 = Instance.new("SpecialMesh")
WedgePart124 = Instance.new("WedgePart")
SpecialMesh125 = Instance.new("SpecialMesh")
WedgePart126 = Instance.new("WedgePart")
SpecialMesh127 = Instance.new("SpecialMesh")
WedgePart128 = Instance.new("WedgePart")
SpecialMesh129 = Instance.new("SpecialMesh")
WedgePart130 = Instance.new("WedgePart")
SpecialMesh131 = Instance.new("SpecialMesh")
WedgePart132 = Instance.new("WedgePart")
SpecialMesh133 = Instance.new("SpecialMesh")
Part134 = Instance.new("Part")
Part135 = Instance.new("Part")
SpecialMesh136 = Instance.new("SpecialMesh")
Part137 = Instance.new("Part")
SpecialMesh138 = Instance.new("SpecialMesh")
Part139 = Instance.new("Part")
SpecialMesh140 = Instance.new("SpecialMesh")
Part141 = Instance.new("Part")
SpecialMesh142 = Instance.new("SpecialMesh")
Part143 = Instance.new("Part")
BlockMesh144 = Instance.new("BlockMesh")
Part145 = Instance.new("Part")
Part146 = Instance.new("Part")
Part147 = Instance.new("Part")
Part148 = Instance.new("Part")
Part149 = Instance.new("Part")
Part150 = Instance.new("Part")
Part151 = Instance.new("Part")
Part152 = Instance.new("Part")
BlockMesh153 = Instance.new("BlockMesh")
Part154 = Instance.new("Part")
Part155 = Instance.new("Part")
SpecialMesh156 = Instance.new("SpecialMesh")
Part157 = Instance.new("Part")
SpecialMesh158 = Instance.new("SpecialMesh")
Part159 = Instance.new("Part")
Part160 = Instance.new("Part")
SpecialMesh161 = Instance.new("SpecialMesh")
Part162 = Instance.new("Part")
SpecialMesh163 = Instance.new("SpecialMesh")
Part164 = Instance.new("Part")
Model165 = Instance.new("Model")
Part166 = Instance.new("Part")
BlockMesh167 = Instance.new("BlockMesh")
Part168 = Instance.new("Part")
Part169 = Instance.new("Part")
SpecialMesh170 = Instance.new("SpecialMesh")
Part171 = Instance.new("Part")
BlockMesh172 = Instance.new("BlockMesh")
Part173 = Instance.new("Part")
Part174 = Instance.new("Part")
Part175 = Instance.new("Part")
Part176 = Instance.new("Part")
Part177 = Instance.new("Part")
BlockMesh178 = Instance.new("BlockMesh")
Part179 = Instance.new("Part")
Part180 = Instance.new("Part")
BlockMesh181 = Instance.new("BlockMesh")
Part182 = Instance.new("Part")
BlockMesh183 = Instance.new("BlockMesh")
Part184 = Instance.new("Part")
Part185 = Instance.new("Part")
Part186 = Instance.new("Part")
SpecialMesh187 = Instance.new("SpecialMesh")
Part188 = Instance.new("Part")
BlockMesh189 = Instance.new("BlockMesh")
Part190 = Instance.new("Part")
BlockMesh191 = Instance.new("BlockMesh")
Part192 = Instance.new("Part")
BlockMesh193 = Instance.new("BlockMesh")
Part194 = Instance.new("Part")
BlockMesh195 = Instance.new("BlockMesh")
Part196 = Instance.new("Part")
Part197 = Instance.new("Part")
Part198 = Instance.new("Part")
BlockMesh199 = Instance.new("BlockMesh")
Part200 = Instance.new("Part")
Part201 = Instance.new("Part")
BlockMesh202 = Instance.new("BlockMesh")
Part203 = Instance.new("Part")
Part204 = Instance.new("Part")
Part205 = Instance.new("Part")
Part206 = Instance.new("Part")
Part207 = Instance.new("Part")
BlockMesh208 = Instance.new("BlockMesh")
Part209 = Instance.new("Part")
BlockMesh210 = Instance.new("BlockMesh")
Model211 = Instance.new("Model")
Part212 = Instance.new("Part")
Part213 = Instance.new("Part")
BlockMesh214 = Instance.new("BlockMesh")
Part215 = Instance.new("Part")
Part216 = Instance.new("Part")
BlockMesh217 = Instance.new("BlockMesh")
Part218 = Instance.new("Part")
BlockMesh219 = Instance.new("BlockMesh")
Part220 = Instance.new("Part")
BlockMesh221 = Instance.new("BlockMesh")
Part222 = Instance.new("Part")
BlockMesh223 = Instance.new("BlockMesh")
Part224 = Instance.new("Part")
BlockMesh225 = Instance.new("BlockMesh")
Part226 = Instance.new("Part")
Model0.Parent = char
Model1.Name = "a"
Model1.Parent = Model0
Part2.Parent = Model1
Part2.Anchored = true
Part2.CanCollide = false
Part2.Size = Vector3.new(0.220000014, 0.219999969, 0.220000014)
Part2.CFrame = CFrame.new(22, 52.4440079, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part2.BottomSurface = Enum.SurfaceType.Smooth
Part2.TopSurface = Enum.SurfaceType.Smooth
Part2.Position = Vector3.new(22, 52.4440079, -39)
Part2.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part3.Parent = Model1
Part3.Rotation = Vector3.new(0, 0, 45)
Part3.Anchored = true
Part3.CanCollide = false
Part3.Size = Vector3.new(0.330000013, 0.330000013, 0.242000014)
Part3.CFrame = CFrame.new(22, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part3.BottomSurface = Enum.SurfaceType.Smooth
Part3.TopSurface = Enum.SurfaceType.Smooth
Part3.Position = Vector3.new(22, 52.6317863, -39)
Part3.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part4.Parent = Model1
Part4.Rotation = Vector3.new(-180, 0, -180)
Part4.Anchored = true
Part4.CanCollide = false
Part4.Size = Vector3.new(0.242000043, 0.165000007, 0.242000043)
Part4.CFrame = CFrame.new(22, 51.1185036, -39, -1, 0, -8.74227766E-8, 0, 1, 0, 8.74227766E-8, 0, -1)
Part4.BottomSurface = Enum.SurfaceType.Smooth
Part4.TopSurface = Enum.SurfaceType.Smooth
Part4.Position = Vector3.new(22, 51.1185036, -39)
Part4.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part5.Parent = Model1
Part5.Rotation = Vector3.new(-180, 0, -15)
Part5.Anchored = true
Part5.CanCollide = false
Part5.Size = Vector3.new(0.329999954, 0.153999999, 0.220000014)
Part5.CFrame = CFrame.new(22.4788837, 52.7045021, -39, 0.965925753, 0.258819401, 0, 0.258819401, -0.965925753, 8.74227766E-8, 2.26267112E-8, -8.44439114E-8, -1)
Part5.BottomSurface = Enum.SurfaceType.Smooth
Part5.TopSurface = Enum.SurfaceType.Smooth
Part5.Position = Vector3.new(22.4788837, 52.7045021, -39)
Part5.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part6.Parent = Model1
Part6.Rotation = Vector3.new(180, 0, 75)
Part6.Anchored = true
Part6.CanCollide = false
Part6.Size = Vector3.new(0.681999981, 0.0550000034, 0.220000014)
Part6.CFrame = CFrame.new(21.2968826, 52.8031921, -39, 0.258818686, -0.965925872, 2.2626649E-8, -0.965925872, -0.258818686, -8.44439185E-8, 8.74227766E-8, 0, -1)
Part6.BottomSurface = Enum.SurfaceType.Smooth
Part6.TopSurface = Enum.SurfaceType.Smooth
Part6.Position = Vector3.new(21.2968826, 52.8031921, -39)
Part6.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh7.Parent = Part6
BlockMesh7.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh7.Scale = Vector3.new(1, 0.400000036, 1)
Part8.Parent = Model1
Part8.Anchored = true
Part8.CanCollide = false
Part8.Size = Vector3.new(0.682000041, 0.153999999, 0.220000014)
Part8.CFrame = CFrame.new(22, 52.6317863, -39, 1, 1.49011612E-7, 0, -1.49011612E-7, 1, 0, 0, 0, 1)
Part8.BottomSurface = Enum.SurfaceType.Smooth
Part8.TopSurface = Enum.SurfaceType.Smooth
Part8.Position = Vector3.new(22, 52.6317863, -39)
Part8.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part9.Parent = Model1
Part9.Rotation = Vector3.new(0, 0, 15)
Part9.Anchored = true
Part9.CanCollide = false
Part9.Size = Vector3.new(0.329999924, 0.153999999, 0.220000014)
Part9.CFrame = CFrame.new(21.5211182, 52.5863647, -39, 0.965925872, -0.258818895, 0, 0.258818895, 0.965925872, 0, 0, 0, 1)
Part9.BottomSurface = Enum.SurfaceType.Smooth
Part9.TopSurface = Enum.SurfaceType.Smooth
Part9.Position = Vector3.new(21.5211182, 52.5863647, -39)
Part9.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part10.Parent = Model1
Part10.Anchored = true
Part10.CanCollide = false
Part10.Size = Vector3.new(0.219999969, 0.186999992, 0.220000014)
Part10.CFrame = CFrame.new(22, 52.4605064, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part10.BottomSurface = Enum.SurfaceType.Smooth
Part10.TopSurface = Enum.SurfaceType.Smooth
Part10.Position = Vector3.new(22, 52.4605064, -39)
Part10.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part11.Parent = Model1
Part11.Rotation = Vector3.new(-180, 0, 140.110001)
Part11.Anchored = true
Part11.CanCollide = false
Part11.Size = Vector3.new(0.189738497, 0.0550000034, 0.220000014)
Part11.CFrame = CFrame.new(22.2197361, 52.5022926, -39, -0.767246246, -0.641352534, 0, -0.641352534, 0.767246246, 0, 0, 0, -1)
Part11.BottomSurface = Enum.SurfaceType.Smooth
Part11.TopSurface = Enum.SurfaceType.Smooth
Part11.Position = Vector3.new(22.2197361, 52.5022926, -39)
Part11.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh12.Parent = Part11
BlockMesh12.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh12.Scale = Vector3.new(1, 0.400000036, 1)
Part13.Parent = Model1
Part13.Rotation = Vector3.new(-90, -15, 0)
Part13.Anchored = true
Part13.CanCollide = false
Part13.Size = Vector3.new(0.0834760517, 0.0550000034, 0.315528691)
Part13.CFrame = CFrame.new(21.3952484, 52.6398468, -38.901001, 0.965925813, 0, -0.258819252, 0.258819252, 0, 0.965925813, 0, -1, 0)
Part13.BottomSurface = Enum.SurfaceType.Smooth
Part13.TopSurface = Enum.SurfaceType.Smooth
Part13.Position = Vector3.new(21.3952484, 52.6398468, -38.901001)
Part13.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh14.Parent = Part13
BlockMesh14.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh14.Scale = Vector3.new(1, 0.400000036, 1)
Part15.Rotation = Vector3.new(-180, 0, -123.689995)
Part15.Anchored = true
Part15.CanCollide = false
Part15.Size = Vector3.new(0.0903219655, 0.0550000034, 0.220000014)
Part15.CFrame = CFrame.new(21.8741035, 52.4106865, -39, -0.554700851, 0.832049966, 0, 0.832049966, 0.554700851, 0, 0, 0, -1)
Part15.BottomSurface = Enum.SurfaceType.Smooth
Part15.TopSurface = Enum.SurfaceType.Smooth
Part15.Position = Vector3.new(21.8741035, 52.4106865, -39)
Part15.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh16.Parent = Part15
BlockMesh16.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh16.Scale = Vector3.new(1, 0.400000036, 1)
Part17.Parent = Model1
Part17.Rotation = Vector3.new(0, 0, -39.8899994)
Part17.Anchored = true
Part17.CanCollide = false
Part17.Size = Vector3.new(0.189738497, 0.0550000034, 0.220000014)
Part17.CFrame = CFrame.new(21.7802696, 52.5022926, -39, 0.767246246, 0.641352534, 0, -0.641352534, 0.767246246, 0, 0, 0, 1)
Part17.BottomSurface = Enum.SurfaceType.Smooth
Part17.TopSurface = Enum.SurfaceType.Smooth
Part17.Position = Vector3.new(21.7802696, 52.5022926, -39)
Part17.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh18.Parent = Part17
BlockMesh18.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh18.Scale = Vector3.new(1, 0.400000036, 1)
Part19.Parent = Model1
Part19.Rotation = Vector3.new(0, 0, 45)
Part19.Anchored = true
Part19.CanCollide = false
Part19.Size = Vector3.new(0.220000014, 0.220000014, 0.242000014)
Part19.CFrame = CFrame.new(21.7800026, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part19.BottomSurface = Enum.SurfaceType.Smooth
Part19.TopSurface = Enum.SurfaceType.Smooth
Part19.Position = Vector3.new(21.7800026, 52.6317863, -39)
Part19.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part20.Parent = Model1
Part20.Rotation = Vector3.new(0, 0, 157.639999)
Part20.Anchored = true
Part20.CanCollide = false
Part20.Size = Vector3.new(0.262767464, 0.0550000034, 0.220000014)
Part20.CFrame = CFrame.new(21.533308, 52.7485847, -39, -0.924840808, -0.380354285, 0, 0.380354285, -0.924840808, 0, 0, 0, 1)
Part20.BottomSurface = Enum.SurfaceType.Smooth
Part20.TopSurface = Enum.SurfaceType.Smooth
Part20.Position = Vector3.new(21.533308, 52.7485847, -39)
Part20.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh21.Parent = Part20
BlockMesh21.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh21.Scale = Vector3.new(1, 0.400000036, 1)
Part22.Parent = Model1
Part22.Rotation = Vector3.new(0, 0, 45)
Part22.Anchored = true
Part22.CanCollide = false
Part22.Size = Vector3.new(0.220000014, 0.220000014, 0.242000014)
Part22.CFrame = CFrame.new(22.2200012, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part22.BottomSurface = Enum.SurfaceType.Smooth
Part22.TopSurface = Enum.SurfaceType.Smooth
Part22.Position = Vector3.new(22.2200012, 52.6317863, -39)
Part22.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part23.Parent = Model1
Part23.Rotation = Vector3.new(-180, 0, 123.689995)
Part23.Anchored = true
Part23.CanCollide = false
Part23.Size = Vector3.new(0.0903219655, 0.0550000034, 0.220000014)
Part23.CFrame = CFrame.new(22.1259003, 52.4106865, -39, -0.554700851, -0.832049966, 0, -0.832049966, 0.554700851, 0, 0, 0, -1)
Part23.BottomSurface = Enum.SurfaceType.Smooth
Part23.TopSurface = Enum.SurfaceType.Smooth
Part23.Position = Vector3.new(22.1259003, 52.4106865, -39)
Part23.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh24.Parent = Part23
BlockMesh24.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh24.Scale = Vector3.new(1, 0.400000036, 1)
Part25.Parent = Model1
Part25.Rotation = Vector3.new(-180, 0, -22.3599987)
Part25.Anchored = true
Part25.CanCollide = false
Part25.Size = Vector3.new(0.262767464, 0.0550000034, 0.220000014)
Part25.CFrame = CFrame.new(22.4666939, 52.7485847, -39, 0.924840808, 0.380354285, 0, 0.380354285, -0.924840808, 0, 0, 0, -1)
Part25.BottomSurface = Enum.SurfaceType.Smooth
Part25.TopSurface = Enum.SurfaceType.Smooth
Part25.Position = Vector3.new(22.4666939, 52.7485847, -39)
Part25.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh26.Parent = Part25
BlockMesh26.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh26.Scale = Vector3.new(1, 0.400000036, 1)
Part27.Parent = Model1
Part27.Rotation = Vector3.new(0, 0, 121.059998)
Part27.Anchored = true
Part27.CanCollide = false
Part27.Size = Vector3.new(0.381347626, 0.0550000034, 0.220000014)
Part27.CFrame = CFrame.new(21.3081932, 52.9664001, -39, -0.515884161, -0.85665828, 0, 0.85665828, -0.515884161, 0, 0, 0, 1)
Part27.BottomSurface = Enum.SurfaceType.Smooth
Part27.TopSurface = Enum.SurfaceType.Smooth
Part27.Position = Vector3.new(21.3081932, 52.9664001, -39)
Part27.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh28.Parent = Part27
BlockMesh28.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh28.Scale = Vector3.new(1, 0.400000036, 1)
Part29.Parent = Model1
Part29.Rotation = Vector3.new(-180, 0, -15)
Part29.Anchored = true
Part29.CanCollide = false
Part29.Size = Vector3.new(0.0550000034, 0.319000036, 0.220000014)
Part29.CFrame = CFrame.new(22.5533619, 52.6390457, -39, 0.965925753, 0.258819401, 0, 0.258819401, -0.965925753, 8.74227766E-8, 2.26267112E-8, -8.44439114E-8, -1)
Part29.BottomSurface = Enum.SurfaceType.Smooth
Part29.TopSurface = Enum.SurfaceType.Smooth
Part29.Position = Vector3.new(22.5533619, 52.6390457, -39)
Part29.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh30.Parent = Part29
BlockMesh30.Scale = Vector3.new(0.399998933, 1, 1)
BlockMesh30.Scale = Vector3.new(0.399998933, 1, 1)
Part31.Parent = Model1
Part31.Rotation = Vector3.new(0, 0, 15)
Part31.Anchored = true
Part31.CanCollide = false
Part31.Size = Vector3.new(0.0550000034, 0.319000036, 0.220000014)
Part31.CFrame = CFrame.new(21.44664, 52.6518173, -39, 0.965925872, -0.258818895, 0, 0.258818895, 0.965925872, 0, 0, 0, 1)
Part31.BottomSurface = Enum.SurfaceType.Smooth
Part31.TopSurface = Enum.SurfaceType.Smooth
Part31.Position = Vector3.new(21.44664, 52.6518173, -39)
Part31.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh32.Parent = Part31
BlockMesh32.Scale = Vector3.new(0.399997979, 1, 1)
BlockMesh32.Scale = Vector3.new(0.399997979, 1, 1)
Part33.Parent = Model1
Part33.Rotation = Vector3.new(90, 15, 0)
Part33.Anchored = true
Part33.CanCollide = false
Part33.Size = Vector3.new(0.0834756419, 0.0550000034, 0.315528393)
Part33.CFrame = CFrame.new(22.6047516, 52.6510201, -39.098999, 0.965925813, 0, 0.258819252, 0.258819252, -8.74227766E-8, -0.965925813, 2.2626697E-8, 1, -8.44439185E-8)
Part33.BottomSurface = Enum.SurfaceType.Smooth
Part33.TopSurface = Enum.SurfaceType.Smooth
Part33.Position = Vector3.new(22.6047516, 52.6510201, -39.098999)
Part33.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh34.Parent = Part33
BlockMesh34.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh34.Scale = Vector3.new(1, 0.400000036, 1)
Part35.Parent = Model1
Part35.Anchored = true
Part35.CanCollide = false
Part35.Size = Vector3.new(0.220000014, 0.120999977, 0.220000014)
Part35.CFrame = CFrame.new(22, 52.4935036, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part35.BottomSurface = Enum.SurfaceType.Smooth
Part35.TopSurface = Enum.SurfaceType.Smooth
Part35.Position = Vector3.new(22, 52.4935036, -39)
Part35.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part36.Parent = Model1
Part36.Rotation = Vector3.new(0, 0, 45)
Part36.Anchored = true
Part36.CanCollide = false
Part36.Size = Vector3.new(0.165000007, 0.165000007, 0.242000014)
Part36.CFrame = CFrame.new(22.5170002, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part36.BottomSurface = Enum.SurfaceType.Smooth
Part36.TopSurface = Enum.SurfaceType.Smooth
Part36.Position = Vector3.new(22.5170002, 52.6317863, -39)
Part36.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part37.Parent = Model1
Part37.Rotation = Vector3.new(0, 0, 45)
Part37.Anchored = true
Part37.CanCollide = false
Part37.Size = Vector3.new(0.165000007, 0.165000007, 0.242000014)
Part37.CFrame = CFrame.new(21.6480007, 52.6867905, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part37.BottomSurface = Enum.SurfaceType.Smooth
Part37.TopSurface = Enum.SurfaceType.Smooth
Part37.Position = Vector3.new(21.6480007, 52.6867905, -39)
Part37.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part38.Parent = Model1
Part38.Rotation = Vector3.new(0, 0, 45)
Part38.Anchored = true
Part38.CanCollide = false
Part38.Size = Vector3.new(0.121000007, 0.121000007, 0.242000014)
Part38.CFrame = CFrame.new(21.4169998, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part38.BottomSurface = Enum.SurfaceType.Smooth
Part38.TopSurface = Enum.SurfaceType.Smooth
Part38.Position = Vector3.new(21.4169998, 52.6317863, -39)
Part38.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part39.Parent = Model1
Part39.Rotation = Vector3.new(0, 90, 0)
Part39.Anchored = true
Part39.CanCollide = false
Part39.Size = Vector3.new(0.109999999, 0.857999921, 0.274999976)
Part39.CFrame = CFrame.new(21.8625011, 57.647007, -39, -4.37113883E-8, 0, 1, 0, 0.99999994, 0, -1, 0, -4.37113883E-8)
Part39.BottomSurface = Enum.SurfaceType.Smooth
Part39.TopSurface = Enum.SurfaceType.Smooth
Part39.Position = Vector3.new(21.8625011, 57.647007, -39)
Part39.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh40.Parent = Part39
SpecialMesh40.MeshType = Enum.MeshType.Wedge
Part41.Parent = Model1
Part41.Rotation = Vector3.new(-180, 0, -105)
Part41.Anchored = true
Part41.CanCollide = false
Part41.Size = Vector3.new(0.13199988, 0.0550000109, 0.220000014)
Part41.CFrame = CFrame.new(22.667532, 52.6204948, -39, -0.258819073, 0.965925872, 0, 0.965925872, 0.258819073, 8.74227766E-8, 8.44439185E-8, 2.26266827E-8, -1)
Part41.BottomSurface = Enum.SurfaceType.Smooth
Part41.TopSurface = Enum.SurfaceType.Smooth
Part41.Position = Vector3.new(22.667532, 52.6204948, -39)
Part41.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part42.Parent = Model1
Part42.Anchored = true
Part42.CanCollide = false
Part42.Size = Vector3.new(0.616000056, 4.62000036, 0.0550000034)
Part42.CFrame = CFrame.new(22, 54.9080048, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part42.BottomSurface = Enum.SurfaceType.Smooth
Part42.TopSurface = Enum.SurfaceType.Smooth
Part42.Position = Vector3.new(22, 54.9080048, -39)
Part42.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh43.Parent = Part42
BlockMesh43.Scale = Vector3.new(1, 1, 0.800000668)
BlockMesh43.Scale = Vector3.new(1, 1, 0.800000668)
Part44.Parent = Model1
Part44.Rotation = Vector3.new(0, 0, 45)
Part44.Anchored = true
Part44.CanCollide = false
Part44.Size = Vector3.new(0.165000007, 0.165000007, 0.242000014)
Part44.CFrame = CFrame.new(21.4830017, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part44.BottomSurface = Enum.SurfaceType.Smooth
Part44.TopSurface = Enum.SurfaceType.Smooth
Part44.Position = Vector3.new(21.4830017, 52.6317863, -39)
Part44.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part45.Parent = Model1
Part45.Rotation = Vector3.new(0, -90, 0)
Part45.Anchored = true
Part45.CanCollide = false
Part45.Size = Vector3.new(0.0879999995, 0.879999876, 0.285999954)
Part45.CFrame = CFrame.new(22.1429996, 57.6580086, -39, 1.31134158E-7, 0, -1, 0, 0.99999994, 0, 1, 0, 1.31134158E-7)
Part45.BottomSurface = Enum.SurfaceType.Smooth
Part45.TopSurface = Enum.SurfaceType.Smooth
Part45.Position = Vector3.new(22.1429996, 57.6580086, -39)
Part45.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh46.Parent = Part45
SpecialMesh46.MeshType = Enum.MeshType.Wedge
Part47.Parent = Model1
Part47.Anchored = true
Part47.CanCollide = false
Part47.Size = Vector3.new(0.528000116, 4.62000036, 0.132000029)
Part47.CFrame = CFrame.new(22, 54.9080048, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part47.BottomSurface = Enum.SurfaceType.Smooth
Part47.TopSurface = Enum.SurfaceType.Smooth
Part47.Position = Vector3.new(22, 54.9080048, -39)
Part47.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part48.Parent = Model1
Part48.Rotation = Vector3.new(0, 0, 45)
Part48.Anchored = true
Part48.CanCollide = false
Part48.Size = Vector3.new(0.165000007, 0.165000007, 0.242000014)
Part48.CFrame = CFrame.new(22.3520012, 52.6867905, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part48.BottomSurface = Enum.SurfaceType.Smooth
Part48.TopSurface = Enum.SurfaceType.Smooth
Part48.Position = Vector3.new(22.3520012, 52.6867905, -39)
Part48.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part49.Parent = Model1
Part49.Rotation = Vector3.new(0, -90, 0)
Part49.Anchored = true
Part49.CanCollide = false
Part49.Size = Vector3.new(0.109999999, 0.857999921, 0.274999976)
Part49.CFrame = CFrame.new(22.1375008, 57.647007, -39, 1.31134158E-7, 0, -1, 0, 0.99999994, 0, 1, 0, 1.31134158E-7)
Part49.BottomSurface = Enum.SurfaceType.Smooth
Part49.TopSurface = Enum.SurfaceType.Smooth
Part49.Position = Vector3.new(22.1375008, 57.647007, -39)
Part49.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh50.Parent = Part49
SpecialMesh50.MeshType = Enum.MeshType.Wedge
Part51.Parent = Model1
Part51.Rotation = Vector3.new(0, -90, 0)
Part51.Anchored = true
Part51.CanCollide = false
Part51.Size = Vector3.new(0.131999999, 0.835999966, 0.263999999)
Part51.CFrame = CFrame.new(22.1320019, 57.6360092, -39, 1.31134158E-7, 0, -1, 0, 0.99999994, 0, 1, 0, 1.31134158E-7)
Part51.BottomSurface = Enum.SurfaceType.Smooth
Part51.TopSurface = Enum.SurfaceType.Smooth
Part51.Position = Vector3.new(22.1320019, 57.6360092, -39)
Part51.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh52.Parent = Part51
SpecialMesh52.MeshType = Enum.MeshType.Wedge
Part53.Parent = Model1
Part53.Rotation = Vector3.new(180, 0, -101.989998)
Part53.Anchored = true
Part53.CanCollide = false
Part53.Size = Vector3.new(0.52322346, 0.0550000034, 0.220000014)
Part53.CFrame = CFrame.new(21.2630978, 52.8760986, -39, -0.207692742, 0.978194058, 0, 0.978194058, 0.207692742, 0, 0, 0, -1)
Part53.BottomSurface = Enum.SurfaceType.Smooth
Part53.TopSurface = Enum.SurfaceType.Smooth
Part53.Position = Vector3.new(21.2630978, 52.8760986, -39)
Part53.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh54.Parent = Part53
BlockMesh54.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh54.Scale = Vector3.new(1, 0.400000036, 1)
Part55.Parent = Model1
Part55.Rotation = Vector3.new(180, 0, 75)
Part55.Anchored = true
Part55.CanCollide = false
Part55.Size = Vector3.new(0.159499928, 0.0550000034, 0.220000014)
Part55.CFrame = CFrame.new(21.3512192, 52.5472832, -39, 0.258818686, -0.965925872, 2.2626649E-8, -0.965925872, -0.258818686, -8.44439185E-8, 8.74227766E-8, 0, -1)
Part55.BottomSurface = Enum.SurfaceType.Smooth
Part55.TopSurface = Enum.SurfaceType.Smooth
Part55.Position = Vector3.new(21.3512192, 52.5472832, -39)
Part55.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh56.Parent = Part55
BlockMesh56.Scale = Vector3.new(1, 0.900000036, 1)
BlockMesh56.Scale = Vector3.new(1, 0.900000036, 1)
Part57.Parent = Model1
Part57.Rotation = Vector3.new(-180, 0, -105)
Part57.Anchored = true
Part57.CanCollide = false
Part57.Size = Vector3.new(0.511499882, 0.0550000034, 0.220000014)
Part57.CFrame = CFrame.new(22.6943359, 52.5735817, -39, -0.258819073, 0.965925872, 0, 0.965925872, 0.258819073, 8.74227766E-8, 8.44439185E-8, 2.26266827E-8, -1)
Part57.BottomSurface = Enum.SurfaceType.Smooth
Part57.TopSurface = Enum.SurfaceType.Smooth
Part57.Position = Vector3.new(22.6943359, 52.5735817, -39)
Part57.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh58.Parent = Part57
BlockMesh58.Scale = Vector3.new(1, 0.900000036, 1)
BlockMesh58.Scale = Vector3.new(1, 0.900000036, 1)
Part59.Parent = Model1
Part59.Rotation = Vector3.new(180, 0, 75)
Part59.Anchored = true
Part59.CanCollide = false
Part59.Size = Vector3.new(0.13199994, 0.0550000109, 0.220000014)
Part59.CFrame = CFrame.new(21.3324699, 52.670372, -39, 0.258818686, -0.965925872, 2.2626649E-8, -0.965925872, -0.258818686, -8.44439185E-8, 8.74227766E-8, 0, -1)
Part59.BottomSurface = Enum.SurfaceType.Smooth
Part59.TopSurface = Enum.SurfaceType.Smooth
Part59.Position = Vector3.new(21.3324699, 52.670372, -39)
Part59.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part60.Parent = Model1
Part60.Rotation = Vector3.new(0, 0, 45)
Part60.Anchored = true
Part60.CanCollide = false
Part60.Size = Vector3.new(0.121000007, 0.120999992, 0.242000014)
Part60.CFrame = CFrame.new(22.5830021, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part60.BottomSurface = Enum.SurfaceType.Smooth
Part60.TopSurface = Enum.SurfaceType.Smooth
Part60.Position = Vector3.new(22.5830021, 52.6317863, -39)
Part60.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part61.Parent = Model1
Part61.Rotation = Vector3.new(0, 90, 0)
Part61.Anchored = true
Part61.CanCollide = false
Part61.Size = Vector3.new(0.153999999, 0.813999951, 0.253000021)
Part61.CFrame = CFrame.new(21.8735008, 57.6250076, -39, -4.37113883E-8, 0, 1, 0, 0.99999994, 0, -1, 0, -4.37113883E-8)
Part61.BottomSurface = Enum.SurfaceType.Smooth
Part61.TopSurface = Enum.SurfaceType.Smooth
Part61.Position = Vector3.new(21.8735008, 57.6250076, -39)
Part61.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh62.Parent = Part61
SpecialMesh62.MeshType = Enum.MeshType.Wedge
Part63.Parent = Model1
Part63.Rotation = Vector3.new(0, -90, 0)
Part63.Anchored = true
Part63.CanCollide = false
Part63.Size = Vector3.new(0.153999999, 0.813999951, 0.253000021)
Part63.CFrame = CFrame.new(22.1265011, 57.6250076, -39, 1.31134158E-7, 0, -1, 0, 0.99999994, 0, 1, 0, 1.31134158E-7)
Part63.BottomSurface = Enum.SurfaceType.Smooth
Part63.TopSurface = Enum.SurfaceType.Smooth
Part63.Position = Vector3.new(22.1265011, 57.6250076, -39)
Part63.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh64.Parent = Part63
SpecialMesh64.MeshType = Enum.MeshType.Wedge
Part65.Parent = Model1
Part65.Anchored = true
Part65.CanCollide = false
Part65.Size = Vector3.new(0.594000101, 4.62000036, 0.0660000369)
Part65.CFrame = CFrame.new(22, 54.9080048, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part65.BottomSurface = Enum.SurfaceType.Smooth
Part65.TopSurface = Enum.SurfaceType.Smooth
Part65.Position = Vector3.new(22, 54.9080048, -39)
Part65.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part66.Parent = Model1
Part66.Rotation = Vector3.new(0, 90, 0)
Part66.Anchored = true
Part66.CanCollide = false
Part66.Size = Vector3.new(0.131999999, 0.835999966, 0.263999999)
Part66.CFrame = CFrame.new(21.8680019, 57.6360092, -39, -4.37113883E-8, 0, 1, 0, 0.99999994, 0, -1, 0, -4.37113883E-8)
Part66.BottomSurface = Enum.SurfaceType.Smooth
Part66.TopSurface = Enum.SurfaceType.Smooth
Part66.Position = Vector3.new(21.8680019, 57.6360092, -39)
Part66.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh67.Parent = Part66
SpecialMesh67.MeshType = Enum.MeshType.Wedge
Part68.Parent = Model1
Part68.Anchored = true
Part68.CanCollide = false
Part68.Size = Vector3.new(0.638000071, 4.62000036, 0.0550000034)
Part68.CFrame = CFrame.new(22, 54.9080048, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part68.BottomSurface = Enum.SurfaceType.Smooth
Part68.TopSurface = Enum.SurfaceType.Smooth
Part68.Position = Vector3.new(22, 54.9080048, -39)
Part68.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh69.Parent = Part68
BlockMesh69.Scale = Vector3.new(1, 1, 0.400000572)
BlockMesh69.Scale = Vector3.new(1, 1, 0.400000572)
Part70.Parent = Model1
Part70.Anchored = true
Part70.CanCollide = false
Part70.Size = Vector3.new(0.550000131, 4.5539999, 0.110000044)
Part70.CFrame = CFrame.new(22, 54.9410095, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part70.BottomSurface = Enum.SurfaceType.Smooth
Part70.TopSurface = Enum.SurfaceType.Smooth
Part70.Position = Vector3.new(22, 54.9410095, -39)
Part70.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part71.Parent = Model1
Part71.Anchored = true
Part71.CanCollide = false
Part71.Size = Vector3.new(0.572000146, 4.62000036, 0.0880000442)
Part71.CFrame = CFrame.new(22, 54.9080048, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part71.BottomSurface = Enum.SurfaceType.Smooth
Part71.TopSurface = Enum.SurfaceType.Smooth
Part71.Position = Vector3.new(22, 54.9080048, -39)
Part71.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part72.Parent = Model1
Part72.Rotation = Vector3.new(0, 90, 0)
Part72.Anchored = true
Part72.CanCollide = false
Part72.Size = Vector3.new(0.0659999996, 0.901999891, 0.296999961)
Part72.CFrame = CFrame.new(21.8515015, 57.6690063, -39, -4.37113883E-8, 0, 1, 0, 0.99999994, 0, -1, 0, -4.37113883E-8)
Part72.BottomSurface = Enum.SurfaceType.Smooth
Part72.TopSurface = Enum.SurfaceType.Smooth
Part72.Position = Vector3.new(21.8515015, 57.6690063, -39)
Part72.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh73.Parent = Part72
SpecialMesh73.MeshType = Enum.MeshType.Wedge
Part74.Parent = Model1
Part74.Rotation = Vector3.new(0, -90, 0)
Part74.Anchored = true
Part74.CanCollide = false
Part74.Size = Vector3.new(0.0659999996, 0.901999891, 0.296999961)
Part74.CFrame = CFrame.new(22.1485004, 57.6690063, -39, 1.31134158E-7, 0, -1, 0, 0.99999994, 0, 1, 0, 1.31134158E-7)
Part74.BottomSurface = Enum.SurfaceType.Smooth
Part74.TopSurface = Enum.SurfaceType.Smooth
Part74.Position = Vector3.new(22.1485004, 57.6690063, -39)
Part74.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh75.Parent = Part74
SpecialMesh75.MeshType = Enum.MeshType.Wedge
Part76.Parent = Model1
Part76.Rotation = Vector3.new(0, -90, 0)
Part76.Anchored = true
Part76.CanCollide = false
Part76.Size = Vector3.new(0.0550000034, 0.923999846, 0.307999939)
Part76.CFrame = CFrame.new(22.1539993, 57.6800041, -39, 1.31134158E-7, 0, -1, 0, 0.99999994, 0, 1, 0, 1.31134158E-7)
Part76.BottomSurface = Enum.SurfaceType.Smooth
Part76.TopSurface = Enum.SurfaceType.Smooth
Part76.Position = Vector3.new(22.1539993, 57.6800041, -39)
Part76.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh77.Parent = Part76
SpecialMesh77.Scale = Vector3.new(0.799999952, 1, 1)
SpecialMesh77.MeshType = Enum.MeshType.Wedge
SpecialMesh77.Scale = Vector3.new(0.799999952, 1, 1)
Part78.Parent = Model1
Part78.Rotation = Vector3.new(0, 90, 0)
Part78.Anchored = true
Part78.CanCollide = false
Part78.Size = Vector3.new(0.0550000034, 0.945999861, 0.318999946)
Part78.CFrame = CFrame.new(21.8405018, 57.6910095, -39, -4.37113883E-8, 0, 1, 0, 0.99999994, 0, -1, 0, -4.37113883E-8)
Part78.BottomSurface = Enum.SurfaceType.Smooth
Part78.TopSurface = Enum.SurfaceType.Smooth
Part78.Position = Vector3.new(21.8405018, 57.6910095, -39)
Part78.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh79.Parent = Part78
SpecialMesh79.Scale = Vector3.new(0.399999946, 1, 1)
SpecialMesh79.MeshType = Enum.MeshType.Wedge
SpecialMesh79.Scale = Vector3.new(0.399999946, 1, 1)
Part80.Parent = Model1
Part80.Rotation = Vector3.new(0, -90, 0)
Part80.Anchored = true
Part80.CanCollide = false
Part80.Size = Vector3.new(0.0550000034, 0.945999861, 0.318999946)
Part80.CFrame = CFrame.new(22.159502, 57.6910095, -39, 1.31134158E-7, 0, -1, 0, 0.99999994, 0, 1, 0, 1.31134158E-7)
Part80.BottomSurface = Enum.SurfaceType.Smooth
Part80.TopSurface = Enum.SurfaceType.Smooth
Part80.Position = Vector3.new(22.159502, 57.6910095, -39)
Part80.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh81.Parent = Part80
SpecialMesh81.Scale = Vector3.new(0.399999946, 1, 1)
SpecialMesh81.MeshType = Enum.MeshType.Wedge
SpecialMesh81.Scale = Vector3.new(0.399999946, 1, 1)
Part82.Parent = Model1
Part82.Rotation = Vector3.new(0, 90, 0)
Part82.Anchored = true
Part82.CanCollide = false
Part82.Size = Vector3.new(0.0879999995, 0.879999876, 0.285999954)
Part82.CFrame = CFrame.new(21.8570023, 57.6580086, -39, -4.37113883E-8, 0, 1, 0, 0.99999994, 0, -1, 0, -4.37113883E-8)
Part82.BottomSurface = Enum.SurfaceType.Smooth
Part82.TopSurface = Enum.SurfaceType.Smooth
Part82.Position = Vector3.new(21.8570023, 57.6580086, -39)
Part82.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh83.Parent = Part82
SpecialMesh83.MeshType = Enum.MeshType.Wedge
Part84.Parent = Model1
Part84.Rotation = Vector3.new(0, 90, 0)
Part84.Anchored = true
Part84.CanCollide = false
Part84.Size = Vector3.new(0.0550000034, 0.923999846, 0.307999939)
Part84.CFrame = CFrame.new(21.8460007, 57.6800041, -39, -4.37113883E-8, 0, 1, 0, 0.99999994, 0, -1, 0, -4.37113883E-8)
Part84.BottomSurface = Enum.SurfaceType.Smooth
Part84.TopSurface = Enum.SurfaceType.Smooth
Part84.Position = Vector3.new(21.8460007, 57.6800041, -39)
Part84.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh85.Parent = Part84
SpecialMesh85.Scale = Vector3.new(0.799999952, 1, 1)
SpecialMesh85.MeshType = Enum.MeshType.Wedge
SpecialMesh85.Scale = Vector3.new(0.799999952, 1, 1)
Part86.Parent = Model1
Part86.Rotation = Vector3.new(180, 0, -138.399994)
Part86.Anchored = true
Part86.CanCollide = false
Part86.Size = Vector3.new(0.293680906, 0.0550000034, 0.220000014)
Part86.CFrame = CFrame.new(22.6341152, 52.4258537, -39, -0.747822225, 0.663899124, 0, 0.663899124, 0.747822225, 0, 0, 0, -1)
Part86.BottomSurface = Enum.SurfaceType.Smooth
Part86.TopSurface = Enum.SurfaceType.Smooth
Part86.Position = Vector3.new(22.6341152, 52.4258537, -39)
Part86.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh87.Parent = Part86
BlockMesh87.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh87.Scale = Vector3.new(1, 0.400000036, 1)
Part88.Parent = Model1
Part88.Rotation = Vector3.new(-180, 0, 172.539993)
Part88.Anchored = true
Part88.CanCollide = false
Part88.Size = Vector3.new(0.299535364, 0.0550000034, 0.241999671)
Part88.CFrame = CFrame.new(22.3670731, 52.5065765, -39, -0.991535306, -0.129837483, 0, -0.129837483, 0.991535306, 0, 0, 0, -1)
Part88.BottomSurface = Enum.SurfaceType.Smooth
Part88.TopSurface = Enum.SurfaceType.Smooth
Part88.Position = Vector3.new(22.3670731, 52.5065765, -39)
Part88.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh89.Parent = Part88
BlockMesh89.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh89.Scale = Vector3.new(1, 0.400000036, 1)
Part90.Parent = Model1
Part90.Rotation = Vector3.new(180, 0, -4.48999977)
Part90.Anchored = true
Part90.CanCollide = false
Part90.Size = Vector3.new(0.300971955, 0.0550000034, 0.220000014)
Part90.CFrame = CFrame.new(22.5028858, 52.8042717, -39, 0.996930718, 0.0782888159, 0, 0.0782888159, -0.996930718, 0, 0, 0, -1)
Part90.BottomSurface = Enum.SurfaceType.Smooth
Part90.TopSurface = Enum.SurfaceType.Smooth
Part90.Position = Vector3.new(22.5028858, 52.8042717, -39)
Part90.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh91.Parent = Part90
BlockMesh91.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh91.Scale = Vector3.new(1, 0.400000036, 1)
Part92.Parent = Model1
Part92.Rotation = Vector3.new(180, 0, 178.360001)
Part92.Anchored = true
Part92.CanCollide = false
Part92.Size = Vector3.new(0.432225823, 0.0550000034, 0.220000014)
Part92.CFrame = CFrame.new(21.5636635, 52.4810295, -39, -0.999589741, -0.0286423229, 0, -0.0286423229, 0.999589741, 0, 0, 0, -1)
Part92.BottomSurface = Enum.SurfaceType.Smooth
Part92.TopSurface = Enum.SurfaceType.Smooth
Part92.Position = Vector3.new(21.5636635, 52.4810295, -39)
Part92.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh93.Parent = Part92
BlockMesh93.Scale = Vector3.new(1, 0.400000036, 1)
BlockMesh93.Scale = Vector3.new(1, 0.400000036, 1)
WedgePart94.Parent = Model1
WedgePart94.Rotation = Vector3.new(90, -50.2700005, -90)
WedgePart94.Anchored = true
WedgePart94.CanCollide = false
WedgePart94.Size = Vector3.new(0.0550000034, 0.334594458, 0.154075369)
WedgePart94.CFrame = CFrame.new(22.651907, 52.6363068, -38.901001, -3.93020869E-8, 0.639107645, -0.769117296, -2.06897255E-9, -0.769117296, -0.639107645, -1, -2.35269795E-8, 3.15502113E-8)
WedgePart94.BottomSurface = Enum.SurfaceType.Smooth
WedgePart94.Position = Vector3.new(22.651907, 52.6363068, -38.901001)
WedgePart94.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh95.Parent = WedgePart94
SpecialMesh95.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh95.MeshType = Enum.MeshType.Wedge
SpecialMesh95.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart96.Parent = Model1
WedgePart96.Rotation = Vector3.new(90, -50.2700005, -90)
WedgePart96.Anchored = true
WedgePart96.CanCollide = false
WedgePart96.Size = Vector3.new(0.0550000034, 0.334594458, 0.154075369)
WedgePart96.CFrame = CFrame.new(22.651907, 52.6363068, -39.098999, -3.93020869E-8, 0.639107645, -0.769117296, -2.06897255E-9, -0.769117296, -0.639107645, -1, -2.35269795E-8, 3.15502113E-8)
WedgePart96.BottomSurface = Enum.SurfaceType.Smooth
WedgePart96.Position = Vector3.new(22.651907, 52.6363068, -39.098999)
WedgePart96.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh97.Parent = WedgePart96
SpecialMesh97.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh97.MeshType = Enum.MeshType.Wedge
SpecialMesh97.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart98.Parent = Model1
WedgePart98.Rotation = Vector3.new(90, 15, -90)
WedgePart98.Anchored = true
WedgePart98.CanCollide = false
WedgePart98.Size = Vector3.new(0.0550000034, 0.0834760368, 0.366471201)
WedgePart98.CFrame = CFrame.new(21.3069916, 52.9692307, -38.901001, -1.95952747E-8, 0.965925872, 0.258819163, -9.57572652E-8, 0.258819163, -0.965925872, -1, -4.37113954E-8, 8.74227766E-8)
WedgePart98.BottomSurface = Enum.SurfaceType.Smooth
WedgePart98.Position = Vector3.new(21.3069916, 52.9692307, -38.901001)
WedgePart98.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh99.Parent = WedgePart98
SpecialMesh99.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh99.MeshType = Enum.MeshType.Wedge
SpecialMesh99.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart100.Parent = Model1
WedgePart100.Rotation = Vector3.new(90, -75, 90)
WedgePart100.Anchored = true
WedgePart100.CanCollide = false
WedgePart100.Size = Vector3.new(0.0550000034, 0.147513002, 0.193248078)
WedgePart100.CFrame = CFrame.new(21.5200367, 52.7421494, -39.098999, -7.31305221E-8, -0.258819997, -0.965925574, -6.48487202E-8, 0.965925574, -0.258819997, 1, 4.37113954E-8, -8.74227766E-8)
WedgePart100.BottomSurface = Enum.SurfaceType.Smooth
WedgePart100.Position = Vector3.new(21.5200367, 52.7421494, -39.098999)
WedgePart100.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh101.Parent = WedgePart100
SpecialMesh101.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh101.MeshType = Enum.MeshType.Wedge
SpecialMesh101.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart102.Parent = Model1
WedgePart102.Rotation = Vector3.new(-90, -15, -90)
WedgePart102.Anchored = true
WedgePart102.CanCollide = false
WedgePart102.Size = Vector3.new(0.0550000034, 0.0921268091, 0.126240641)
WedgePart102.CFrame = CFrame.new(21.3794575, 52.7154961, -39.098999, 1.95953138E-8, 0.965925872, -0.258818656, 9.57572439E-8, 0.258818656, 0.965925872, 1, -4.37113883E-8, -8.74227766E-8)
WedgePart102.BottomSurface = Enum.SurfaceType.Smooth
WedgePart102.Position = Vector3.new(21.3794575, 52.7154961, -39.098999)
WedgePart102.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh103.Parent = WedgePart102
SpecialMesh103.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh103.MeshType = Enum.MeshType.Wedge
SpecialMesh103.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart104.Parent = Model1
WedgePart104.Rotation = Vector3.new(90, 15, 90)
WedgePart104.Anchored = true
WedgePart104.CanCollide = false
WedgePart104.Size = Vector3.new(0.0550000034, 0.0843335092, 0.309443384)
WedgePart104.CFrame = CFrame.new(22.60355, 52.6538506, -38.901001, -1.95952676E-8, -0.965925694, 0.258819103, -1.8318002E-7, -0.258819103, -0.965925694, 1, -6.63380746E-8, -1.71866674E-7)
WedgePart104.BottomSurface = Enum.SurfaceType.Smooth
WedgePart104.Position = Vector3.new(22.60355, 52.6538506, -38.901001)
WedgePart104.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh105.Parent = WedgePart104
SpecialMesh105.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh105.MeshType = Enum.MeshType.Wedge
SpecialMesh105.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart106.Parent = Model1
WedgePart106.Rotation = Vector3.new(-90, 50.2700005, -90)
WedgePart106.Anchored = true
WedgePart106.CanCollide = false
WedgePart106.Size = Vector3.new(0.0550000034, 0.334594458, 0.177300364)
WedgePart106.CFrame = CFrame.new(22.5244732, 52.5304108, -39.098999, 3.9302094E-8, 0.639107585, 0.769117355, 2.06897255E-9, -0.769117355, 0.639107585, 1, -2.35269795E-8, -3.15502184E-8)
WedgePart106.BottomSurface = Enum.SurfaceType.Smooth
WedgePart106.Position = Vector3.new(22.5244732, 52.5304108, -39.098999)
WedgePart106.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh107.Parent = WedgePart106
SpecialMesh107.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh107.MeshType = Enum.MeshType.Wedge
SpecialMesh107.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart108.Parent = Model1
WedgePart108.Rotation = Vector3.new(-90, 75, 90)
WedgePart108.Anchored = true
WedgePart108.CanCollide = false
WedgePart108.Size = Vector3.new(0.0550000034, 0.147513002, 0.107651152)
WedgePart108.CFrame = CFrame.new(21.3747139, 52.7032127, -39.098999, 7.3130515E-8, -0.258820087, 0.965925574, 6.48487202E-8, 0.965925574, 0.258820087, -1, 4.37113883E-8, 8.74227766E-8)
WedgePart108.BottomSurface = Enum.SurfaceType.Smooth
WedgePart108.Position = Vector3.new(21.3747139, 52.7032127, -39.098999)
WedgePart108.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh109.Parent = WedgePart108
SpecialMesh109.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh109.MeshType = Enum.MeshType.Wedge
SpecialMesh109.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart110.Parent = Model1
WedgePart110.Rotation = Vector3.new(-90, 75, -90)
WedgePart110.Anchored = true
WedgePart110.CanCollide = false
WedgePart110.Size = Vector3.new(0.0550000034, 0.0550000034, 0.0550000034)
WedgePart110.CFrame = CFrame.new(21.4365311, 52.4857788, -38.901001, 7.31305576E-8, 0.258819401, 0.965925753, 6.48486775E-8, -0.965925753, 0.258819401, 1, 4.37113954E-8, -8.74227766E-8)
WedgePart110.BottomSurface = Enum.SurfaceType.Smooth
WedgePart110.Position = Vector3.new(21.4365311, 52.4857788, -38.901001)
WedgePart110.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh111.Parent = WedgePart110
SpecialMesh111.Scale = Vector3.new(0.400000036, 0.0631167963, 1.5177449)
SpecialMesh111.MeshType = Enum.MeshType.Wedge
SpecialMesh111.Scale = Vector3.new(0.400000036, 0.0631167963, 1.5177449)
WedgePart112.Parent = Model1
WedgePart112.Rotation = Vector3.new(90, -75, 90)
WedgePart112.Anchored = true
WedgePart112.CanCollide = false
WedgePart112.Size = Vector3.new(0.0550000034, 0.0550000034, 0.0550000034)
WedgePart112.CFrame = CFrame.new(22.5634708, 52.8050842, -39.098999, -7.31304794E-8, -0.258820623, -0.965925395, -1.52271554E-7, 0.965925395, -0.258820623, 1, 1.28155278E-7, -1.10049598E-7)
WedgePart112.BottomSurface = Enum.SurfaceType.Smooth
WedgePart112.Position = Vector3.new(22.5634708, 52.8050842, -39.098999)
WedgePart112.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh113.Parent = WedgePart112
SpecialMesh113.Scale = Vector3.new(0.400000036, 0.0631251559, 1.51773918)
SpecialMesh113.MeshType = Enum.MeshType.Wedge
SpecialMesh113.Scale = Vector3.new(0.400000036, 0.0631251559, 1.51773918)
WedgePart114.Parent = Model1
WedgePart114.Rotation = Vector3.new(-90, 50.2700005, 90)
WedgePart114.Anchored = true
WedgePart114.CanCollide = false
WedgePart114.Size = Vector3.new(0.0550000034, 0.334594667, 0.154075891)
WedgePart114.CFrame = CFrame.new(21.3480968, 52.6545639, -38.901001, 3.93020443E-8, -0.639108121, 0.769116998, 8.94917775E-8, 0.769116998, 0.639108121, -1, 4.37113883E-8, 8.74227766E-8)
WedgePart114.BottomSurface = Enum.SurfaceType.Smooth
WedgePart114.Position = Vector3.new(21.3480968, 52.6545639, -38.901001)
WedgePart114.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh115.Parent = WedgePart114
SpecialMesh115.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh115.MeshType = Enum.MeshType.Wedge
SpecialMesh115.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart116.Parent = Model1
WedgePart116.Rotation = Vector3.new(90, 15, -90)
WedgePart116.Anchored = true
WedgePart116.CanCollide = false
WedgePart116.Size = Vector3.new(0.0550000034, 0.0921268091, 0.383958161)
WedgePart116.CFrame = CFrame.new(21.3134327, 52.9619026, -39.098999, -1.9595312E-8, 0.965925872, 0.258818746, -9.5757251E-8, 0.258818746, -0.965925872, -1, -4.37113954E-8, 8.74227766E-8)
WedgePart116.BottomSurface = Enum.SurfaceType.Smooth
WedgePart116.Position = Vector3.new(21.3134327, 52.9619026, -39.098999)
WedgePart116.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh117.Parent = WedgePart116
SpecialMesh117.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh117.MeshType = Enum.MeshType.Wedge
SpecialMesh117.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart118.Parent = Model1
WedgePart118.Rotation = Vector3.new(90, -50.2700005, 90)
WedgePart118.Anchored = true
WedgePart118.CanCollide = false
WedgePart118.Size = Vector3.new(0.0550000034, 0.334594667, 0.177300245)
WedgePart118.CFrame = CFrame.new(21.4755306, 52.7604561, -38.901001, -3.93020443E-8, -0.639108062, -0.769117057, -8.94917846E-8, 0.769117057, -0.639108062, 1, 4.37113954E-8, -8.74227766E-8)
WedgePart118.BottomSurface = Enum.SurfaceType.Smooth
WedgePart118.Position = Vector3.new(21.4755306, 52.7604561, -38.901001)
WedgePart118.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh119.Parent = WedgePart118
SpecialMesh119.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh119.MeshType = Enum.MeshType.Wedge
SpecialMesh119.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart120.Parent = Model1
WedgePart120.Rotation = Vector3.new(-90, 50.2700005, -90)
WedgePart120.Anchored = true
WedgePart120.CanCollide = false
WedgePart120.Size = Vector3.new(0.0550000034, 0.334594458, 0.177300364)
WedgePart120.CFrame = CFrame.new(22.5244732, 52.5304108, -38.901001, 3.9302094E-8, 0.639107585, 0.769117355, 2.06897255E-9, -0.769117355, 0.639107585, 1, -2.35269795E-8, -3.15502184E-8)
WedgePart120.BottomSurface = Enum.SurfaceType.Smooth
WedgePart120.Position = Vector3.new(22.5244732, 52.5304108, -38.901001)
WedgePart120.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh121.Parent = WedgePart120
SpecialMesh121.Scale = Vector3.new(0.400000036, 1, 1)
SpecialMesh121.MeshType = Enum.MeshType.Wedge
SpecialMesh121.Scale = Vector3.new(0.400000036, 1, 1)
WedgePart122.Parent = Model1
WedgePart122.Rotation = Vector3.new(-90, -48.3999977, -180)
WedgePart122.Anchored = true
WedgePart122.CanCollide = false
WedgePart122.Size = Vector3.new(0.0550000034, 0.0550000034, 0.0550000034)
WedgePart122.CFrame = CFrame.new(22.6341152, 52.4258537, -38.8844986, -0.663899124, 3.63567345E-8, -0.747822165, -0.747822106, -9.07282498E-8, 0.663899183, -4.37113883E-8, 1, 8.74227766E-8)
WedgePart122.BottomSurface = Enum.SurfaceType.Smooth
WedgePart122.Position = Vector3.new(22.6341152, 52.4258537, -38.8844986)
WedgePart122.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh123.Parent = WedgePart122
SpecialMesh123.Scale = Vector3.new(0.400000036, 0.199996963, 5.33965302)
SpecialMesh123.MeshType = Enum.MeshType.Wedge
SpecialMesh123.Scale = Vector3.new(0.400000036, 0.199996963, 5.33965302)
WedgePart124.Parent = Model1
WedgePart124.Rotation = Vector3.new(0, 0, -131.599991)
WedgePart124.Anchored = true
WedgePart124.CanCollide = false
WedgePart124.Size = Vector3.new(0.0550000034, 0.0550000034, 0.0550000034)
WedgePart124.CFrame = CFrame.new(22.6341152, 52.4258537, -39.1155014, -0.663899124, 0.747822165, 1.23416584E-7, -0.747822165, -0.663899124, 7.33679073E-9, 8.74227837E-8, -8.74227695E-8, 1)
WedgePart124.BottomSurface = Enum.SurfaceType.Smooth
WedgePart124.Position = Vector3.new(22.6341152, 52.4258537, -39.1155014)
WedgePart124.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh125.Parent = WedgePart124
SpecialMesh125.Scale = Vector3.new(0.400000036, 5.33965302, 0.199996963)
SpecialMesh125.MeshType = Enum.MeshType.Wedge
SpecialMesh125.Scale = Vector3.new(0.400000036, 5.33965302, 0.199996963)
WedgePart126.Parent = Model1
WedgePart126.Rotation = Vector3.new(0, 0, -85.5099945)
WedgePart126.Anchored = true
WedgePart126.CanCollide = false
WedgePart126.Size = Vector3.new(0.0550000034, 0.0550000034, 0.0550000034)
WedgePart126.CFrame = CFrame.new(22.5028858, 52.8042717, -39.1155014, 0.0782887712, 0.996930778, 8.03102296E-8, -0.996930778, 0.0782887712, 9.39986791E-8, 8.74227837E-8, -8.74227695E-8, 1)
WedgePart126.BottomSurface = Enum.SurfaceType.Smooth
WedgePart126.Position = Vector3.new(22.5028858, 52.8042717, -39.1155014)
WedgePart126.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh127.Parent = WedgePart126
SpecialMesh127.Scale = Vector3.new(0.400000036, 5.47221756, 0.199996963)
SpecialMesh127.MeshType = Enum.MeshType.Wedge
SpecialMesh127.Scale = Vector3.new(0.400000036, 5.47221756, 0.199996963)
WedgePart128.Parent = Model1
WedgePart128.Rotation = Vector3.new(90, -85.5099945, 0)
WedgePart128.Anchored = true
WedgePart128.CanCollide = false
WedgePart128.Size = Vector3.new(0.0550000034, 0.0550000034, 0.0550000034)
WedgePart128.CFrame = CFrame.new(22.5028858, 52.8042717, -38.8844986, 0.0782887265, 9.05765631E-8, -0.996930718, -0.996930778, -3.67330095E-8, -0.0782887265, -4.37113883E-8, 1, 8.74227766E-8)
WedgePart128.BottomSurface = Enum.SurfaceType.Smooth
WedgePart128.Position = Vector3.new(22.5028858, 52.8042717, -38.8844986)
WedgePart128.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh129.Parent = WedgePart128
SpecialMesh129.Scale = Vector3.new(0.400000036, 0.199996963, 5.47221756)
SpecialMesh129.MeshType = Enum.MeshType.Wedge
SpecialMesh129.Scale = Vector3.new(0.400000036, 0.199996963, 5.47221756)
WedgePart130.Parent = Model1
WedgePart130.Rotation = Vector3.new(0, 0, 91.6399994)
WedgePart130.Anchored = true
WedgePart130.CanCollide = false
WedgePart130.Size = Vector3.new(0.0550000034, 0.0550000034, 0.0550000034)
WedgePart130.CFrame = CFrame.new(21.5636635, 52.4810295, -39.1155014, -0.02864228, -0.999589682, -8.48829202E-8, 0.999589682, -0.02864228, -8.98908965E-8, 8.74227837E-8, -8.74227695E-8, 1)
WedgePart130.BottomSurface = Enum.SurfaceType.Smooth
WedgePart130.Position = Vector3.new(21.5636635, 52.4810295, -39.1155014)
WedgePart130.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh131.Parent = WedgePart130
SpecialMesh131.Scale = Vector3.new(0.400000036, 7.85865116, 0.199996963)
SpecialMesh131.MeshType = Enum.MeshType.Wedge
SpecialMesh131.Scale = Vector3.new(0.400000036, 7.85865116, 0.199996963)
WedgePart132.Parent = Model1
WedgePart132.Rotation = Vector3.new(-90, 88.3600006, 180)
WedgePart132.Anchored = true
WedgePart132.CanCollide = false
WedgePart132.Size = Vector3.new(0.0550000034, 0.0550000034, 0.0550000034)
WedgePart132.CFrame = CFrame.new(21.5636635, 52.4810295, -38.8844986, -0.0286422353, -8.86388989E-8, 0.999589741, 0.999589682, 4.11894696E-8, 0.0286422353, -4.37113883E-8, 1, 8.74227766E-8)
WedgePart132.BottomSurface = Enum.SurfaceType.Smooth
WedgePart132.Position = Vector3.new(21.5636635, 52.4810295, -38.8844986)
WedgePart132.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh133.Parent = WedgePart132
SpecialMesh133.Scale = Vector3.new(0.400000036, 0.199996963, 7.85865116)
SpecialMesh133.MeshType = Enum.MeshType.Wedge
SpecialMesh133.Scale = Vector3.new(0.400000036, 0.199996963, 7.85865116)
Part134.Name = "HitBox"
Part134.Parent = Model1
Part134.Anchored = true
Part134.CanCollide = false
Part134.Size = Vector3.new(0.462000161, 4.62000036, 0.198000059)
Part134.CFrame = CFrame.new(22, 54.9080048, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part134.BottomSurface = Enum.SurfaceType.Smooth
Part134.TopSurface = Enum.SurfaceType.Smooth
Part134.Position = Vector3.new(22, 54.9080048, -39)
Part134.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part135.Parent = Model165
Part135.Material = Enum.Material.Neon
Part135.Rotation = Vector3.new(0, -90, 0)
Part135.Anchored = true
Part135.CanCollide = false
Part135.Size = Vector3.new(0.176000014, 0.791999996, 0.241999984)
Part135.CFrame = CFrame.new(22.1210022, 57.614006, -39, 1.31134158E-7, 0, -1, 0, 0.99999994, 0, 1, 0, 1.31134158E-7)
Part135.BottomSurface = Enum.SurfaceType.Smooth
Part135.TopSurface = Enum.SurfaceType.Smooth
Part135.Position = Vector3.new(22.1210022, 57.614006, -39)
Part135.Color = Color3.new(1, 0, 0)
SpecialMesh136.Parent = Part135
SpecialMesh136.MeshType = Enum.MeshType.Wedge
Part137.Parent = Model165
Part137.Material = Enum.Material.Neon
Part137.Rotation = Vector3.new(0, 90, 0)
Part137.Anchored = true
Part137.CanCollide = false
Part137.Size = Vector3.new(0.176000014, 0.791999996, 0.241999984)
Part137.CFrame = CFrame.new(21.8789997, 57.614006, -39, -4.37113883E-8, 0, 1, 0, 0.99999994, 0, -1, 0, -4.37113883E-8)
Part137.BottomSurface = Enum.SurfaceType.Smooth
Part137.TopSurface = Enum.SurfaceType.Smooth
Part137.Position = Vector3.new(21.8789997, 57.614006, -39)
Part137.Color = Color3.new(1, 0, 0)
SpecialMesh138.Parent = Part137
SpecialMesh138.MeshType = Enum.MeshType.Wedge
Part139.Parent = Model1
Part139.Rotation = Vector3.new(0, 90, 0)
Part139.Anchored = true
Part139.CanCollide = false
Part139.Size = Vector3.new(0.198000014, 0.769999981, 0.230999991)
Part139.CFrame = CFrame.new(21.8845024, 57.6030045, -39, -4.37113883E-8, 0, 1, 0, 0.99999994, 0, -1, 0, -4.37113883E-8)
Part139.BottomSurface = Enum.SurfaceType.Smooth
Part139.TopSurface = Enum.SurfaceType.Smooth
Part139.Position = Vector3.new(21.8845024, 57.6030045, -39)
Part139.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh140.Parent = Part139
SpecialMesh140.MeshType = Enum.MeshType.Wedge
Part141.Parent = Model1
Part141.Rotation = Vector3.new(0, -90, 0)
Part141.Anchored = true
Part141.CanCollide = false
Part141.Size = Vector3.new(0.198000014, 0.769999981, 0.230999991)
Part141.CFrame = CFrame.new(22.1155014, 57.6030045, -39, 1.31134158E-7, 0, -1, 0, 0.99999994, 0, 1, 0, 1.31134158E-7)
Part141.BottomSurface = Enum.SurfaceType.Smooth
Part141.TopSurface = Enum.SurfaceType.Smooth
Part141.Position = Vector3.new(22.1155014, 57.6030045, -39)
Part141.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh142.Parent = Part141
SpecialMesh142.MeshType = Enum.MeshType.Wedge
Part143.Parent = Model1
Part143.Rotation = Vector3.new(0, 0, 45)
Part143.Anchored = true
Part143.CanCollide = false
Part143.Size = Vector3.new(0.0550000034, 0.0550000034, 0.286000043)
Part143.CFrame = CFrame.new(21.4169998, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part143.BottomSurface = Enum.SurfaceType.Smooth
Part143.TopSurface = Enum.SurfaceType.Smooth
Part143.Position = Vector3.new(21.4169998, 52.6317863, -39)
Part143.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh144.Parent = Part143
BlockMesh144.Scale = Vector3.new(0.999999881, 0.999999881, 1)
BlockMesh144.Scale = Vector3.new(0.999999881, 0.999999881, 1)
Part145.Parent = Model1
Part145.Rotation = Vector3.new(0, 0, 45)
Part145.Anchored = true
Part145.CanCollide = false
Part145.Size = Vector3.new(0.153999984, 0.153999984, 0.286000043)
Part145.CFrame = CFrame.new(21.7800026, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part145.BottomSurface = Enum.SurfaceType.Smooth
Part145.TopSurface = Enum.SurfaceType.Smooth
Part145.Position = Vector3.new(21.7800026, 52.6317863, -39)
Part145.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part146.Parent = Model1
Part146.Rotation = Vector3.new(0, 0, 45)
Part146.Anchored = true
Part146.CanCollide = false
Part146.Size = Vector3.new(0.263999999, 0.263999999, 0.286000043)
Part146.CFrame = CFrame.new(22, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part146.BottomSurface = Enum.SurfaceType.Smooth
Part146.TopSurface = Enum.SurfaceType.Smooth
Part146.Position = Vector3.new(22, 52.6317863, -39)
Part146.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part147.Parent = Model1
Part147.Rotation = Vector3.new(0, 0, 45)
Part147.Anchored = true
Part147.CanCollide = false
Part147.Size = Vector3.new(0.0989999995, 0.0989999995, 0.286000043)
Part147.CFrame = CFrame.new(21.4830017, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part147.BottomSurface = Enum.SurfaceType.Smooth
Part147.TopSurface = Enum.SurfaceType.Smooth
Part147.Position = Vector3.new(21.4830017, 52.6317863, -39)
Part147.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part148.Parent = Model1
Part148.Rotation = Vector3.new(0, 0, 45)
Part148.Anchored = true
Part148.CanCollide = false
Part148.Size = Vector3.new(0.0989999995, 0.0989999995, 0.286000043)
Part148.CFrame = CFrame.new(22.5170002, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part148.BottomSurface = Enum.SurfaceType.Smooth
Part148.TopSurface = Enum.SurfaceType.Smooth
Part148.Position = Vector3.new(22.5170002, 52.6317863, -39)
Part148.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part149.Parent = Model1
Part149.Rotation = Vector3.new(0, 0, 45)
Part149.Anchored = true
Part149.CanCollide = false
Part149.Size = Vector3.new(0.0989999995, 0.0989999995, 0.286000043)
Part149.CFrame = CFrame.new(21.6518917, 52.6828995, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part149.BottomSurface = Enum.SurfaceType.Smooth
Part149.TopSurface = Enum.SurfaceType.Smooth
Part149.Position = Vector3.new(21.6518917, 52.6828995, -39)
Part149.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part150.Parent = Model1
Part150.Rotation = Vector3.new(0, 0, 45)
Part150.Anchored = true
Part150.CanCollide = false
Part150.Size = Vector3.new(0.0989999995, 0.0989999995, 0.286000043)
Part150.CFrame = CFrame.new(22.3481121, 52.6828995, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part150.BottomSurface = Enum.SurfaceType.Smooth
Part150.TopSurface = Enum.SurfaceType.Smooth
Part150.Position = Vector3.new(22.3481121, 52.6828995, -39)
Part150.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part151.Parent = Model1
Part151.Rotation = Vector3.new(0, 0, 45)
Part151.Anchored = true
Part151.CanCollide = false
Part151.Size = Vector3.new(0.153999984, 0.153999984, 0.286000043)
Part151.CFrame = CFrame.new(22.2200012, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part151.BottomSurface = Enum.SurfaceType.Smooth
Part151.TopSurface = Enum.SurfaceType.Smooth
Part151.Position = Vector3.new(22.2200012, 52.6317863, -39)
Part151.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part152.Parent = Model1
Part152.Rotation = Vector3.new(0, 0, 45)
Part152.Anchored = true
Part152.CanCollide = false
Part152.Size = Vector3.new(0.0550000034, 0.0550000034, 0.286000043)
Part152.CFrame = CFrame.new(22.5830021, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part152.BottomSurface = Enum.SurfaceType.Smooth
Part152.TopSurface = Enum.SurfaceType.Smooth
Part152.Position = Vector3.new(22.5830021, 52.6317863, -39)
Part152.Color = Color3.new(0.105882, 0.164706, 0.207843)
BlockMesh153.Parent = Part152
BlockMesh153.Scale = Vector3.new(0.999999881, 0.999999881, 1)
BlockMesh153.Scale = Vector3.new(0.999999881, 0.999999881, 1)
Part154.Parent = Model1
Part154.Rotation = Vector3.new(0, 0, 90)
Part154.Anchored = true
Part154.CanCollide = false
Part154.Size = Vector3.new(0.175999999, 0.175999984, 0.330000043)
Part154.CFrame = CFrame.new(22, 52.6317863, -39, 0, -0.99999994, 0, 0.99999994, 0, 0, 0, 0, 1)
Part154.BottomSurface = Enum.SurfaceType.Smooth
Part154.TopSurface = Enum.SurfaceType.Smooth
Part154.Position = Vector3.new(22, 52.6317863, -39)
Part154.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part155.Parent = Model1
Part155.Rotation = Vector3.new(180, 90, 0)
Part155.Anchored = true
Part155.CanCollide = false
Part155.Size = Vector3.new(0.242000043, 0.165000007, 0.0990000293)
Part155.CFrame = CFrame.new(21.8295002, 51.1185036, -39, 7.54978942E-8, 7.64274186E-15, 1, 8.74227766E-8, -1, 1.04250613E-15, 1, 8.74227766E-8, -7.54978942E-8)
Part155.BottomSurface = Enum.SurfaceType.Smooth
Part155.TopSurface = Enum.SurfaceType.Smooth
Part155.Position = Vector3.new(21.8295002, 51.1185036, -39)
Part155.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh156.Parent = Part155
SpecialMesh156.MeshType = Enum.MeshType.Wedge
Part157.Parent = Model1
Part157.Rotation = Vector3.new(0, -90, 0)
Part157.Anchored = true
Part157.CanCollide = false
Part157.Size = Vector3.new(0.242000043, 0.165000007, 0.0660000443)
Part157.CFrame = CFrame.new(22.1539993, 51.1185036, -39, 1.19248824E-8, -7.64274186E-15, -1, 0, 1, -7.64274186E-15, 1, 6.68149738E-22, 1.19248824E-8)
Part157.BottomSurface = Enum.SurfaceType.Smooth
Part157.TopSurface = Enum.SurfaceType.Smooth
Part157.Position = Vector3.new(22.1539993, 51.1185036, -39)
Part157.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh158.Parent = Part157
SpecialMesh158.MeshType = Enum.MeshType.Wedge
Part159.Parent = Model1
Part159.Rotation = Vector3.new(-180, 0, -180)
Part159.Anchored = true
Part159.CanCollide = false
Part159.Size = Vector3.new(0.198000029, 0.120999992, 0.286000073)
Part159.CFrame = CFrame.new(22, 51.1185036, -39, -1, 0, -8.74227766E-8, 0, 1, 0, 8.74227766E-8, 0, -1)
Part159.BottomSurface = Enum.SurfaceType.Smooth
Part159.TopSurface = Enum.SurfaceType.Smooth
Part159.Position = Vector3.new(22, 51.1185036, -39)
Part159.Color = Color3.new(0.105882, 0.164706, 0.207843)
Part160.Parent = Model1
Part160.Rotation = Vector3.new(0, -90, 0)
Part160.Anchored = true
Part160.CanCollide = false
Part160.Size = Vector3.new(0.286000043, 0.120999992, 0.0550000034)
Part160.CFrame = CFrame.new(22.1210022, 51.1185036, -39, 1.19248824E-8, -7.64274186E-15, -1, 0, 1, -7.64274186E-15, 1, 6.68149738E-22, 1.19248824E-8)
Part160.BottomSurface = Enum.SurfaceType.Smooth
Part160.TopSurface = Enum.SurfaceType.Smooth
Part160.Position = Vector3.new(22.1210022, 51.1185036, -39)
Part160.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh161.Parent = Part160
SpecialMesh161.Scale = Vector3.new(1, 1, 0.800000727)
SpecialMesh161.MeshType = Enum.MeshType.Wedge
SpecialMesh161.Scale = Vector3.new(1, 1, 0.800000727)
Part162.Parent = Model1
Part162.Rotation = Vector3.new(180, 90, 0)
Part162.Anchored = true
Part162.CanCollide = false
Part162.Size = Vector3.new(0.286000043, 0.120999992, 0.0770000219)
Part162.CFrame = CFrame.new(21.8625011, 51.1185036, -39, 7.54978942E-8, 7.64274186E-15, 1, 8.74227766E-8, -1, 1.04250613E-15, 1, 8.74227766E-8, -7.54978942E-8)
Part162.BottomSurface = Enum.SurfaceType.Smooth
Part162.TopSurface = Enum.SurfaceType.Smooth
Part162.Position = Vector3.new(21.8625011, 51.1185036, -39)
Part162.Color = Color3.new(0.105882, 0.164706, 0.207843)
SpecialMesh163.Parent = Part162
SpecialMesh163.MeshType = Enum.MeshType.Wedge
Part164.Parent = Model1
Part164.Anchored = true
Part164.CanCollide = false
Part164.Size = Vector3.new(0.506000161, 4.62000036, 0.154000044)
Part164.CFrame = CFrame.new(22, 54.9080048, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part164.BottomSurface = Enum.SurfaceType.Smooth
Part164.TopSurface = Enum.SurfaceType.Smooth
Part164.Position = Vector3.new(22, 54.9080048, -39)
Part164.Color = Color3.new(0.105882, 0.164706, 0.207843)
Model165.Name = "b"
Model165.Parent = Model0
Part166.Parent = Model165
Part166.Material = Enum.Material.Neon
Part166.Rotation = Vector3.new(-180, 0, -105)
Part166.Anchored = true
Part166.CanCollide = false
Part166.Size = Vector3.new(0.0550000034, 0.0550000034, 0.25850001)
Part166.CFrame = CFrame.new(22.7570648, 52.3341599, -39, -0.258819073, 0.965925872, 0, 0.965925872, 0.258819073, 8.74227766E-8, 8.44439185E-8, 2.26266827E-8, -1)
Part166.BottomSurface = Enum.SurfaceType.Smooth
Part166.TopSurface = Enum.SurfaceType.Smooth
Part166.Position = Vector3.new(22.7570648, 52.3341599, -39)
Part166.Color = Color3.new(1, 0, 0)
BlockMesh167.Parent = Part166
BlockMesh167.Scale = Vector3.new(0.200000018, 0.550000072, 1)
BlockMesh167.Scale = Vector3.new(0.200000018, 0.550000072, 1)
Part168.Parent = Model165
Part168.Material = Enum.Material.Neon
Part168.Rotation = Vector3.new(0, 0, 45)
Part168.Anchored = true
Part168.CanCollide = false
Part168.Size = Vector3.new(0.120999992, 0.120999992, 0.264000028)
Part168.CFrame = CFrame.new(21.4830017, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part168.BottomSurface = Enum.SurfaceType.Smooth
Part168.TopSurface = Enum.SurfaceType.Smooth
Part168.Position = Vector3.new(21.4830017, 52.6317863, -39)
Part168.Color = Color3.new(1, 0, 0)
Part169.Parent = Model165
Part169.Material = Enum.Material.Neon
Part169.Rotation = Vector3.new(0, -90, 0)
Part169.Anchored = true
Part169.CanCollide = false
Part169.Size = Vector3.new(0.264000058, 0.142999992, 0.0550000444)
Part169.CFrame = CFrame.new(22.1375008, 51.1185036, -39, 1.19248824E-8, -7.64274186E-15, -1, 0, 1, -7.64274186E-15, 1, 6.68149738E-22, 1.19248824E-8)
Part169.BottomSurface = Enum.SurfaceType.Smooth
Part169.TopSurface = Enum.SurfaceType.Smooth
Part169.Position = Vector3.new(22.1375008, 51.1185036, -39)
Part169.Color = Color3.new(1, 0, 0)
SpecialMesh170.Parent = Part169
SpecialMesh170.MeshType = Enum.MeshType.Wedge
Part171.Parent = Model165
Part171.Material = Enum.Material.Neon
Part171.Rotation = Vector3.new(180, 0, -4.48999977)
Part171.Anchored = true
Part171.CanCollide = false
Part171.Size = Vector3.new(0.300971955, 0.0550000034, 0.25850001)
Part171.CFrame = CFrame.new(22.5028858, 52.8042717, -39, 0.996930718, 0.0782888159, 0, 0.0782888159, -0.996930718, 0, 0, 0, -1)
Part171.BottomSurface = Enum.SurfaceType.Smooth
Part171.TopSurface = Enum.SurfaceType.Smooth
Part171.Position = Vector3.new(22.5028858, 52.8042717, -39)
Part171.Color = Color3.new(1, 0, 0)
BlockMesh172.Parent = Part171
BlockMesh172.Scale = Vector3.new(1, 0.200000018, 1)
BlockMesh172.Scale = Vector3.new(1, 0.200000018, 1)
Part173.Parent = Model165
Part173.Transparency = 0.5
Part173.Anchored = true
Part173.CanCollide = false
Part173.Size = Vector3.new(0.197999999, 0.121000007, 0.197999999)
Part173.CFrame = CFrame.new(22, 52.0975037, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part173.BottomSurface = Enum.SurfaceType.Smooth
Part173.TopSurface = Enum.SurfaceType.Smooth
Part173.Position = Vector3.new(22, 52.0975037, -39)
Part173.Color = Color3.new(1, 0, 0)
Part174.Parent = Model165
Part174.Transparency = 0.5
Part174.Anchored = true
Part174.CanCollide = false
Part174.Size = Vector3.new(0.197999999, 0.121000007, 0.197999999)
Part174.CFrame = CFrame.new(22, 51.4375076, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part174.BottomSurface = Enum.SurfaceType.Smooth
Part174.TopSurface = Enum.SurfaceType.Smooth
Part174.Position = Vector3.new(22, 51.4375076, -39)
Part174.Color = Color3.new(1, 0, 0)
Part175.Parent = Model165
Part175.Material = Enum.Material.Neon
Part175.Rotation = Vector3.new(0, 0, 45)
Part175.Anchored = true
Part175.CanCollide = false
Part175.Size = Vector3.new(0.120999992, 0.120999992, 0.264000028)
Part175.CFrame = CFrame.new(21.6518917, 52.6828995, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part175.BottomSurface = Enum.SurfaceType.Smooth
Part175.TopSurface = Enum.SurfaceType.Smooth
Part175.Position = Vector3.new(21.6518917, 52.6828995, -39)
Part175.Color = Color3.new(1, 0, 0)
Part176.Parent = Model165
Part176.Material = Enum.Material.Neon
Part176.Rotation = Vector3.new(0, 0, 45)
Part176.Anchored = true
Part176.CanCollide = false
Part176.Size = Vector3.new(0.0769999921, 0.0769999921, 0.264000028)
Part176.CFrame = CFrame.new(22.5830021, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part176.BottomSurface = Enum.SurfaceType.Smooth
Part176.TopSurface = Enum.SurfaceType.Smooth
Part176.Position = Vector3.new(22.5830021, 52.6317863, -39)
Part176.Color = Color3.new(1, 0, 0)
Part177.Parent = Model165
Part177.Material = Enum.Material.Neon
Part177.Rotation = Vector3.new(180, 0, -101.989998)
Part177.Anchored = true
Part177.CanCollide = false
Part177.Size = Vector3.new(0.52322346, 0.0550000034, 0.25850001)
Part177.CFrame = CFrame.new(21.2630978, 52.8760986, -39, -0.207692742, 0.978194058, 0, 0.978194058, 0.207692742, 0, 0, 0, -1)
Part177.BottomSurface = Enum.SurfaceType.Smooth
Part177.TopSurface = Enum.SurfaceType.Smooth
Part177.Position = Vector3.new(21.2630978, 52.8760986, -39)
Part177.Color = Color3.new(1, 0, 0)
BlockMesh178.Parent = Part177
BlockMesh178.Scale = Vector3.new(1, 0.200000018, 1)
BlockMesh178.Scale = Vector3.new(1, 0.200000018, 1)
Part179.Parent = Model165
Part179.Material = Enum.Material.Neon
Part179.Rotation = Vector3.new(0, 0, 45)
Part179.Anchored = true
Part179.CanCollide = false
Part179.Size = Vector3.new(0.120999992, 0.120999992, 0.264000028)
Part179.CFrame = CFrame.new(22.3481121, 52.6828995, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part179.BottomSurface = Enum.SurfaceType.Smooth
Part179.TopSurface = Enum.SurfaceType.Smooth
Part179.Position = Vector3.new(22.3481121, 52.6828995, -39)
Part179.Color = Color3.new(1, 0, 0)
Part180.Parent = Model165
Part180.Material = Enum.Material.Neon
Part180.Rotation = Vector3.new(0, 0, 121.059998)
Part180.Anchored = true
Part180.CanCollide = false
Part180.Size = Vector3.new(0.392347634, 0.0550000034, 0.25850001)
Part180.CFrame = CFrame.new(21.3110313, 52.961689, -39, -0.515884161, -0.85665828, 0, 0.85665828, -0.515884161, 0, 0, 0, 1)
Part180.BottomSurface = Enum.SurfaceType.Smooth
Part180.TopSurface = Enum.SurfaceType.Smooth
Part180.Position = Vector3.new(21.3110313, 52.961689, -39)
Part180.Color = Color3.new(1, 0, 0)
BlockMesh181.Parent = Part180
BlockMesh181.Scale = Vector3.new(1, 0.200000018, 1)
BlockMesh181.Scale = Vector3.new(1, 0.200000018, 1)
Part182.Parent = Model165
Part182.Material = Enum.Material.Neon
Part182.Rotation = Vector3.new(180, 0, 75)
Part182.Anchored = true
Part182.CanCollide = false
Part182.Size = Vector3.new(0.159499928, 0.0550000034, 0.25850001)
Part182.CFrame = CFrame.new(21.3379383, 52.5437241, -39, 0.258818686, -0.965925872, 2.2626649E-8, -0.965925872, -0.258818686, -8.44439185E-8, 8.74227766E-8, 0, -1)
Part182.BottomSurface = Enum.SurfaceType.Smooth
Part182.TopSurface = Enum.SurfaceType.Smooth
Part182.Position = Vector3.new(21.3379383, 52.5437241, -39)
Part182.Color = Color3.new(1, 0, 0)
BlockMesh183.Parent = Part182
BlockMesh183.Scale = Vector3.new(1, 0.200000018, 1)
BlockMesh183.Scale = Vector3.new(1, 0.200000018, 1)
Part184.Parent = Model165
Part184.Material = Enum.Material.Neon
Part184.Anchored = true
Part184.CanCollide = false
Part184.Size = Vector3.new(0.484000176, 4.62000036, 0.176000044)
Part184.CFrame = CFrame.new(22, 54.9080048, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part184.BottomSurface = Enum.SurfaceType.Smooth
Part184.TopSurface = Enum.SurfaceType.Smooth
Part184.Position = Vector3.new(22, 54.9080048, -39)
Part184.Color = Color3.new(1, 0, 0)
Part185.Parent = Model165
Part185.Material = Enum.Material.Neon
Part185.Rotation = Vector3.new(-180, 0, -180)
Part185.Anchored = true
Part185.CanCollide = false
Part185.Size = Vector3.new(0.220000044, 0.142999992, 0.264000028)
Part185.CFrame = CFrame.new(22, 51.1185036, -39, -1, 0, -8.74227766E-8, 0, 1, 0, 8.74227766E-8, 0, -1)
Part185.BottomSurface = Enum.SurfaceType.Smooth
Part185.TopSurface = Enum.SurfaceType.Smooth
Part185.Position = Vector3.new(22, 51.1185036, -39)
Part185.Color = Color3.new(1, 0, 0)
Part186.Parent = Model165
Part186.Material = Enum.Material.Neon
Part186.Rotation = Vector3.new(180, 90, 0)
Part186.Anchored = true
Part186.CanCollide = false
Part186.Size = Vector3.new(0.264000058, 0.142999992, 0.0880000293)
Part186.CFrame = CFrame.new(21.8460007, 51.1185036, -39, 7.54978942E-8, 7.64274186E-15, 1, 8.74227766E-8, -1, 1.04250613E-15, 1, 8.74227766E-8, -7.54978942E-8)
Part186.BottomSurface = Enum.SurfaceType.Smooth
Part186.TopSurface = Enum.SurfaceType.Smooth
Part186.Position = Vector3.new(21.8460007, 51.1185036, -39)
Part186.Color = Color3.new(1, 0, 0)
SpecialMesh187.Parent = Part186
SpecialMesh187.MeshType = Enum.MeshType.Wedge
Part188.Parent = Model165
Part188.Material = Enum.Material.Neon
Part188.Rotation = Vector3.new(-180, 0, -138.399994)
Part188.Anchored = true
Part188.CanCollide = false
Part188.Size = Vector3.new(0.301930904, 0.0550000034, 0.264000058)
Part188.CFrame = CFrame.new(22.6310291, 52.4285889, -39, -0.747822225, 0.663899124, 0, 0.663899124, 0.747822225, 0, 0, 0, -1)
Part188.BottomSurface = Enum.SurfaceType.Smooth
Part188.TopSurface = Enum.SurfaceType.Smooth
Part188.Position = Vector3.new(22.6310291, 52.4285889, -39)
Part188.Color = Color3.new(1, 0, 0)
BlockMesh189.Parent = Part188
BlockMesh189.Scale = Vector3.new(1, 0.200000018, 1)
BlockMesh189.Scale = Vector3.new(1, 0.200000018, 1)
Part190.Parent = Model165
Part190.Material = Enum.Material.Neon
Part190.Rotation = Vector3.new(-180, 0, 172.539993)
Part190.Anchored = true
Part190.CanCollide = false
Part190.Size = Vector3.new(0.285785377, 0.0550000034, 0.263999701)
Part190.CFrame = CFrame.new(22.3820705, 52.5085411, -39, -0.991535306, -0.129837483, 0, -0.129837483, 0.991535306, 0, 0, 0, -1)
Part190.BottomSurface = Enum.SurfaceType.Smooth
Part190.TopSurface = Enum.SurfaceType.Smooth
Part190.Position = Vector3.new(22.3820705, 52.5085411, -39)
Part190.Color = Color3.new(1, 0, 0)
BlockMesh191.Parent = Part190
BlockMesh191.Scale = Vector3.new(1, 0.200000018, 1)
BlockMesh191.Scale = Vector3.new(1, 0.200000018, 1)
Part192.Parent = Model165
Part192.Material = Enum.Material.Neon
Part192.Rotation = Vector3.new(-180, 0, 178.360001)
Part192.Anchored = true
Part192.CanCollide = false
Part192.Size = Vector3.new(0.396475852, 0.0550000034, 0.25850001)
Part192.CFrame = CFrame.new(21.5567894, 52.4808311, -39, -0.999589741, -0.0286423229, 0, -0.0286423229, 0.999589741, 0, 0, 0, -1)
Part192.BottomSurface = Enum.SurfaceType.Smooth
Part192.TopSurface = Enum.SurfaceType.Smooth
Part192.Position = Vector3.new(21.5567894, 52.4808311, -39)
Part192.Color = Color3.new(1, 0, 0)
BlockMesh193.Parent = Part192
BlockMesh193.Scale = Vector3.new(1, 0.200000018, 1)
BlockMesh193.Scale = Vector3.new(1, 0.200000018, 1)
Part194.Parent = Model165
Part194.Material = Enum.Material.Neon
Part194.Rotation = Vector3.new(-180, 0, -105)
Part194.Anchored = true
Part194.CanCollide = false
Part194.Size = Vector3.new(0.508749902, 0.0550000034, 0.25850001)
Part194.CFrame = CFrame.new(22.7072601, 52.5784683, -39, -0.258819073, 0.965925872, 0, 0.965925872, 0.258819073, 8.74227766E-8, 8.44439185E-8, 2.26266827E-8, -1)
Part194.BottomSurface = Enum.SurfaceType.Smooth
Part194.TopSurface = Enum.SurfaceType.Smooth
Part194.Position = Vector3.new(22.7072601, 52.5784683, -39)
Part194.Color = Color3.new(1, 0, 0)
BlockMesh195.Parent = Part194
BlockMesh195.Scale = Vector3.new(1, 0.200000018, 1)
BlockMesh195.Scale = Vector3.new(1, 0.200000018, 1)
Part196.Parent = Model165
Part196.Material = Enum.Material.Neon
Part196.Rotation = Vector3.new(0, 0, 90)
Part196.Anchored = true
Part196.CanCollide = false
Part196.Size = Vector3.new(0.197999999, 0.197999984, 0.308000028)
Part196.CFrame = CFrame.new(22, 52.6317863, -39, 0, -0.99999994, 0, 0.99999994, 0, 0, 0, 0, 1)
Part196.BottomSurface = Enum.SurfaceType.Smooth
Part196.TopSurface = Enum.SurfaceType.Smooth
Part196.Position = Vector3.new(22, 52.6317863, -39)
Part196.Color = Color3.new(1, 0, 0)
Part197.Parent = Model165
Part197.Material = Enum.Material.Neon
Part197.Rotation = Vector3.new(0, 0, 45)
Part197.Anchored = true
Part197.CanCollide = false
Part197.Size = Vector3.new(0.175999999, 0.175999999, 0.264000028)
Part197.CFrame = CFrame.new(22.2200012, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part197.BottomSurface = Enum.SurfaceType.Smooth
Part197.TopSurface = Enum.SurfaceType.Smooth
Part197.Position = Vector3.new(22.2200012, 52.6317863, -39)
Part197.Color = Color3.new(1, 0, 0)
Part198.Parent = Model165
Part198.Material = Enum.Material.Neon
Part198.Rotation = Vector3.new(0, 0, 60)
Part198.Anchored = true
Part198.CanCollide = false
Part198.Size = Vector3.new(0.165000007, 0.0550000034, 0.264000028)
Part198.CFrame = CFrame.new(22.3177452, 52.7215843, -39, 0.49999994, -0.866025269, 0, 0.866025269, 0.49999994, 0, 0, 0, 1)
Part198.BottomSurface = Enum.SurfaceType.Smooth
Part198.TopSurface = Enum.SurfaceType.Smooth
Part198.Position = Vector3.new(22.3177452, 52.7215843, -39)
Part198.Color = Color3.new(1, 0, 0)
BlockMesh199.Parent = Part198
BlockMesh199.Scale = Vector3.new(1, 0.200000092, 1)
BlockMesh199.Scale = Vector3.new(1, 0.200000092, 1)
Part200.Parent = Model165
Part200.Material = Enum.Material.Neon
Part200.Rotation = Vector3.new(0, 0, 45)
Part200.Anchored = true
Part200.CanCollide = false
Part200.Size = Vector3.new(0.285999984, 0.285999984, 0.264000028)
Part200.CFrame = CFrame.new(22, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part200.BottomSurface = Enum.SurfaceType.Smooth
Part200.TopSurface = Enum.SurfaceType.Smooth
Part200.Position = Vector3.new(22, 52.6317863, -39)
Part200.Color = Color3.new(1, 0, 0)
Part201.Parent = Model165
Part201.Material = Enum.Material.Neon
Part201.Rotation = Vector3.new(0, 0, 157.639999)
Part201.Anchored = true
Part201.CanCollide = false
Part201.Size = Vector3.new(0.262767464, 0.0550000034, 0.25850001)
Part201.CFrame = CFrame.new(21.533308, 52.7485847, -39, -0.924840808, -0.380354285, 0, 0.380354285, -0.924840808, 0, 0, 0, 1)
Part201.BottomSurface = Enum.SurfaceType.Smooth
Part201.TopSurface = Enum.SurfaceType.Smooth
Part201.Position = Vector3.new(21.533308, 52.7485847, -39)
Part201.Color = Color3.new(1, 0, 0)
BlockMesh202.Parent = Part201
BlockMesh202.Scale = Vector3.new(1, 0.200000018, 1)
BlockMesh202.Scale = Vector3.new(1, 0.200000018, 1)
Part203.Parent = Model165
Part203.Material = Enum.Material.Neon
Part203.Rotation = Vector3.new(0, 0, 45)
Part203.Anchored = true
Part203.CanCollide = false
Part203.Size = Vector3.new(0.0769999921, 0.0769999921, 0.264000028)
Part203.CFrame = CFrame.new(21.4169998, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part203.BottomSurface = Enum.SurfaceType.Smooth
Part203.TopSurface = Enum.SurfaceType.Smooth
Part203.Position = Vector3.new(21.4169998, 52.6317863, -39)
Part203.Color = Color3.new(1, 0, 0)
Part204.Parent = Model165
Part204.Material = Enum.Material.Neon
Part204.Rotation = Vector3.new(0, 0, 45)
Part204.Anchored = true
Part204.CanCollide = false
Part204.Size = Vector3.new(0.175999999, 0.175999999, 0.264000028)
Part204.CFrame = CFrame.new(21.7800026, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part204.BottomSurface = Enum.SurfaceType.Smooth
Part204.TopSurface = Enum.SurfaceType.Smooth
Part204.Position = Vector3.new(21.7800026, 52.6317863, -39)
Part204.Color = Color3.new(1, 0, 0)
Part205.Name = "asd"
Part205.Parent = Model165
Part205.Material = Enum.Material.Neon
Part205.Anchored = true
Part205.CanCollide = false
Part205.Size = Vector3.new(0.176000014, 1.19900012, 0.176000014)
Part205.CFrame = CFrame.new(22, 51.7345047, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part205.BottomSurface = Enum.SurfaceType.Smooth
Part205.TopSurface = Enum.SurfaceType.Smooth
Part205.Position = Vector3.new(22, 51.7345047, -39)
Part205.Color = Color3.new(1, 0, 0)
Part206.Parent = Model165
Part206.Material = Enum.Material.Neon
Part206.Rotation = Vector3.new(0, 0, 45)
Part206.Anchored = true
Part206.CanCollide = false
Part206.Size = Vector3.new(0.120999992, 0.120999992, 0.264000028)
Part206.CFrame = CFrame.new(22.5170002, 52.6317863, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part206.BottomSurface = Enum.SurfaceType.Smooth
Part206.TopSurface = Enum.SurfaceType.Smooth
Part206.Position = Vector3.new(22.5170002, 52.6317863, -39)
Part206.Color = Color3.new(1, 0, 0)
Part207.Parent = Model165
Part207.Material = Enum.Material.Neon
Part207.Rotation = Vector3.new(0, 0, 45)
Part207.Anchored = true
Part207.CanCollide = false
Part207.Size = Vector3.new(0.098999992, 0.0550000034, 0.264000028)
Part207.CFrame = CFrame.new(21.7877808, 52.522892, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part207.BottomSurface = Enum.SurfaceType.Smooth
Part207.TopSurface = Enum.SurfaceType.Smooth
Part207.Position = Vector3.new(21.7877808, 52.522892, -39)
Part207.Color = Color3.new(1, 0, 0)
BlockMesh208.Parent = Part207
BlockMesh208.Scale = Vector3.new(1, 0.199999809, 1)
BlockMesh208.Scale = Vector3.new(1, 0.199999809, 1)
Part209.Parent = Model165
Part209.Material = Enum.Material.Neon
Part209.Rotation = Vector3.new(0, 0, 45)
Part209.Anchored = true
Part209.CanCollide = false
Part209.Size = Vector3.new(0.0550000034, 0.209000006, 0.264000028)
Part209.CFrame = CFrame.new(22.1733322, 52.5617867, -39, 0.707106769, -0.707106769, 0, 0.707106769, 0.707106769, 0, 0, 0, 1)
Part209.BottomSurface = Enum.SurfaceType.Smooth
Part209.TopSurface = Enum.SurfaceType.Smooth
Part209.Position = Vector3.new(22.1733322, 52.5617867, -39)
Part209.Color = Color3.new(1, 0, 0)
BlockMesh210.Parent = Part209
BlockMesh210.Scale = Vector3.new(0.199999809, 1, 1)
BlockMesh210.Scale = Vector3.new(0.199999809, 1, 1)
Model211.Name = "c"
Model211.Parent = Model0
Part212.Parent = Model211
Part212.Anchored = true
Part212.CanCollide = false
Part212.Size = Vector3.new(0.197999999, 0.132000029, 0.197999999)
Part212.CFrame = CFrame.new(22, 51.2890053, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part212.BottomSurface = Enum.SurfaceType.Smooth
Part212.TopSurface = Enum.SurfaceType.Smooth
Part212.Position = Vector3.new(22, 51.2890053, -39)
Part212.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part213.Parent = Model211
Part213.Anchored = true
Part213.CanCollide = false
Part213.Size = Vector3.new(0.220000014, 0.0550000034, 0.220000014)
Part213.CFrame = CFrame.new(22, 51.2120056, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part213.BottomSurface = Enum.SurfaceType.Smooth
Part213.TopSurface = Enum.SurfaceType.Smooth
Part213.Position = Vector3.new(22, 51.2120056, -39)
Part213.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh214.Parent = Part213
BlockMesh214.Scale = Vector3.new(1, 0.400000811, 1)
BlockMesh214.Scale = Vector3.new(1, 0.400000811, 1)
Part215.Parent = Model211
Part215.Anchored = true
Part215.CanCollide = false
Part215.Size = Vector3.new(0.197999999, 0.494999975, 0.197999999)
Part215.CFrame = CFrame.new(22, 51.7675056, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part215.BottomSurface = Enum.SurfaceType.Smooth
Part215.TopSurface = Enum.SurfaceType.Smooth
Part215.Position = Vector3.new(22, 51.7675056, -39)
Part215.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part216.Parent = Model211
Part216.Anchored = true
Part216.CanCollide = false
Part216.Size = Vector3.new(0.220000014, 0.0550000034, 0.220000014)
Part216.CFrame = CFrame.new(22, 52.3230057, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part216.BottomSurface = Enum.SurfaceType.Smooth
Part216.TopSurface = Enum.SurfaceType.Smooth
Part216.Position = Vector3.new(22, 52.3230057, -39)
Part216.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh217.Parent = Part216
BlockMesh217.Scale = Vector3.new(1, 0.400000811, 1)
BlockMesh217.Scale = Vector3.new(1, 0.400000811, 1)
Part218.Parent = Model211
Part218.Anchored = true
Part218.CanCollide = false
Part218.Size = Vector3.new(0.220000014, 0.0550000034, 0.219999999)
Part218.CFrame = CFrame.new(22, 52.1690063, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part218.BottomSurface = Enum.SurfaceType.Smooth
Part218.TopSurface = Enum.SurfaceType.Smooth
Part218.Position = Vector3.new(22, 52.1690063, -39)
Part218.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh219.Parent = Part218
BlockMesh219.Scale = Vector3.new(1, 0.400000811, 1)
BlockMesh219.Scale = Vector3.new(1, 0.400000811, 1)
Part220.Parent = Model211
Part220.Anchored = true
Part220.CanCollide = false
Part220.Size = Vector3.new(0.220000014, 0.0550000034, 0.219999999)
Part220.CFrame = CFrame.new(22, 52.0260048, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part220.BottomSurface = Enum.SurfaceType.Smooth
Part220.TopSurface = Enum.SurfaceType.Smooth
Part220.Position = Vector3.new(22, 52.0260048, -39)
Part220.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh221.Parent = Part220
BlockMesh221.Scale = Vector3.new(1, 0.400000811, 1)
BlockMesh221.Scale = Vector3.new(1, 0.400000811, 1)
Part222.Parent = Model211
Part222.Anchored = true
Part222.CanCollide = false
Part222.Size = Vector3.new(0.220000014, 0.0550000034, 0.219999999)
Part222.CFrame = CFrame.new(22, 51.5090027, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part222.BottomSurface = Enum.SurfaceType.Smooth
Part222.TopSurface = Enum.SurfaceType.Smooth
Part222.Position = Vector3.new(22, 51.5090027, -39)
Part222.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh223.Parent = Part222
BlockMesh223.Scale = Vector3.new(1, 0.400000811, 1)
BlockMesh223.Scale = Vector3.new(1, 0.400000811, 1)
Part224.Parent = Model211
Part224.Anchored = true
Part224.CanCollide = false
Part224.Size = Vector3.new(0.220000014, 0.0550000034, 0.219999999)
Part224.CFrame = CFrame.new(22, 51.3660049, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part224.BottomSurface = Enum.SurfaceType.Smooth
Part224.TopSurface = Enum.SurfaceType.Smooth
Part224.Position = Vector3.new(22, 51.3660049, -39)
Part224.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh225.Parent = Part224
BlockMesh225.Scale = Vector3.new(1, 0.400000811, 1)
BlockMesh225.Scale = Vector3.new(1, 0.400000811, 1)
Part226.Parent = Model211
Part226.Anchored = true
Part226.CanCollide = false
Part226.Size = Vector3.new(0.197999999, 0.132000029, 0.197999999)
Part226.CFrame = CFrame.new(22, 52.246006, -39, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part226.BottomSurface = Enum.SurfaceType.Smooth
Part226.TopSurface = Enum.SurfaceType.Smooth
Part226.Position = Vector3.new(22, 52.246006, -39)
Part226.Color = Color3.new(0.388235, 0.372549, 0.384314)
sword = Model0
weld(sword)
sw = newWeld(rarm, sword.b.asd, 0, -1, 0)
sw.C1 = CFrame.Angles(0, rad(90), 0) * CFrame.Angles(rad(90), 0, 0)
drew = true
wing1 = nil
wing2 = nil
function makewing()
	Model0 = Instance.new("Model")
	Model1 = Instance.new("Model")
	Model2 = Instance.new("Model")
	Part3 = Instance.new("Part")
	Part4 = Instance.new("Part")
	Part5 = Instance.new("Part")
	Part6 = Instance.new("Part")
	Part7 = Instance.new("Part")
	Part8 = Instance.new("Part")
	Part9 = Instance.new("Part")
	Part10 = Instance.new("Part")
	Part11 = Instance.new("Part")
	Part12 = Instance.new("Part")
	Part13 = Instance.new("Part")
	Part14 = Instance.new("Part")
	Part15 = Instance.new("Part")
	Part16 = Instance.new("Part")
	Part17 = Instance.new("Part")
	Part18 = Instance.new("Part")
	Part19 = Instance.new("Part")
	Part20 = Instance.new("Part")
	Part21 = Instance.new("Part")
	Part22 = Instance.new("Part")
	Part23 = Instance.new("Part")
	Part24 = Instance.new("Part")
	Part25 = Instance.new("Part")
	Part26 = Instance.new("Part")
	Part27 = Instance.new("Part")
	Part28 = Instance.new("Part")
	Part29 = Instance.new("Part")
	Part30 = Instance.new("Part")
	Part31 = Instance.new("Part")
	Part32 = Instance.new("Part")
	Part33 = Instance.new("Part")
	Part34 = Instance.new("Part")
	Part35 = Instance.new("Part")
	Part36 = Instance.new("Part")
	Part37 = Instance.new("Part")
	Part38 = Instance.new("Part")
	Part39 = Instance.new("Part")
	Part40 = Instance.new("Part")
	Part41 = Instance.new("Part")
	Part42 = Instance.new("Part")
	Part43 = Instance.new("Part")
	Part44 = Instance.new("Part")
	Part45 = Instance.new("Part")
	Part46 = Instance.new("Part")
	Part47 = Instance.new("Part")
	Part48 = Instance.new("Part")
	Part49 = Instance.new("Part")
	Part50 = Instance.new("Part")
	Part51 = Instance.new("Part")
	Part52 = Instance.new("Part")
	Part53 = Instance.new("Part")
	Part54 = Instance.new("Part")
	Part55 = Instance.new("Part")
	Part56 = Instance.new("Part")
	Part57 = Instance.new("Part")
	Part58 = Instance.new("Part")
	Part59 = Instance.new("Part")
	Part60 = Instance.new("Part")
	Part61 = Instance.new("Part")
	Part62 = Instance.new("Part")
	Part63 = Instance.new("Part")
	Part64 = Instance.new("Part")
	Part65 = Instance.new("Part")
	Part66 = Instance.new("Part")
	Part67 = Instance.new("Part")
	Part68 = Instance.new("Part")
	Part69 = Instance.new("Part")
	Part70 = Instance.new("Part")
	Part71 = Instance.new("Part")
	Part72 = Instance.new("Part")
	Part73 = Instance.new("Part")
	Model74 = Instance.new("Model")
	Part75 = Instance.new("Part")
	BlockMesh76 = Instance.new("BlockMesh")
	Part77 = Instance.new("Part")
	BlockMesh78 = Instance.new("BlockMesh")
	Part79 = Instance.new("Part")
	BlockMesh80 = Instance.new("BlockMesh")
	Part81 = Instance.new("Part")
	BlockMesh82 = Instance.new("BlockMesh")
	Part83 = Instance.new("Part")
	BlockMesh84 = Instance.new("BlockMesh")
	Part85 = Instance.new("Part")
	BlockMesh86 = Instance.new("BlockMesh")
	Part87 = Instance.new("Part")
	BlockMesh88 = Instance.new("BlockMesh")
	Part89 = Instance.new("Part")
	BlockMesh90 = Instance.new("BlockMesh")
	Part91 = Instance.new("Part")
	BlockMesh92 = Instance.new("BlockMesh")
	Part93 = Instance.new("Part")
	BlockMesh94 = Instance.new("BlockMesh")
	Part95 = Instance.new("Part")
	BlockMesh96 = Instance.new("BlockMesh")
	Part97 = Instance.new("Part")
	BlockMesh98 = Instance.new("BlockMesh")
	Part99 = Instance.new("Part")
	BlockMesh100 = Instance.new("BlockMesh")
	Part101 = Instance.new("Part")
	BlockMesh102 = Instance.new("BlockMesh")
	Part103 = Instance.new("Part")
	BlockMesh104 = Instance.new("BlockMesh")
	Part105 = Instance.new("Part")
	BlockMesh106 = Instance.new("BlockMesh")
	Part107 = Instance.new("Part")
	BlockMesh108 = Instance.new("BlockMesh")
	Part109 = Instance.new("Part")
	BlockMesh110 = Instance.new("BlockMesh")
	Part111 = Instance.new("Part")
	BlockMesh112 = Instance.new("BlockMesh")
	Part113 = Instance.new("Part")
	BlockMesh114 = Instance.new("BlockMesh")
	Part115 = Instance.new("Part")
	BlockMesh116 = Instance.new("BlockMesh")
	Part117 = Instance.new("Part")
	BlockMesh118 = Instance.new("BlockMesh")
	Part119 = Instance.new("Part")
	BlockMesh120 = Instance.new("BlockMesh")
	Part121 = Instance.new("Part")
	BlockMesh122 = Instance.new("BlockMesh")
	Part123 = Instance.new("Part")
	BlockMesh124 = Instance.new("BlockMesh")
	Part125 = Instance.new("Part")
	BlockMesh126 = Instance.new("BlockMesh")
	Part127 = Instance.new("Part")
	BlockMesh128 = Instance.new("BlockMesh")
	Part129 = Instance.new("Part")
	BlockMesh130 = Instance.new("BlockMesh")
	Part131 = Instance.new("Part")
	BlockMesh132 = Instance.new("BlockMesh")
	Part133 = Instance.new("Part")
	BlockMesh134 = Instance.new("BlockMesh")
	Part135 = Instance.new("Part")
	BlockMesh136 = Instance.new("BlockMesh")
	Part137 = Instance.new("Part")
	BlockMesh138 = Instance.new("BlockMesh")
	Part139 = Instance.new("Part")
	BlockMesh140 = Instance.new("BlockMesh")
	Part141 = Instance.new("Part")
	BlockMesh142 = Instance.new("BlockMesh")
	Part143 = Instance.new("Part")
	BlockMesh144 = Instance.new("BlockMesh")
	Part145 = Instance.new("Part")
	BlockMesh146 = Instance.new("BlockMesh")
	Part147 = Instance.new("Part")
	BlockMesh148 = Instance.new("BlockMesh")
	Part149 = Instance.new("Part")
	BlockMesh150 = Instance.new("BlockMesh")
	Part151 = Instance.new("Part")
	BlockMesh152 = Instance.new("BlockMesh")
	Part153 = Instance.new("Part")
	BlockMesh154 = Instance.new("BlockMesh")
	Part155 = Instance.new("Part")
	BlockMesh156 = Instance.new("BlockMesh")
	Part157 = Instance.new("Part")
	BlockMesh158 = Instance.new("BlockMesh")
	Part159 = Instance.new("Part")
	BlockMesh160 = Instance.new("BlockMesh")
	Part161 = Instance.new("Part")
	BlockMesh162 = Instance.new("BlockMesh")
	Part163 = Instance.new("Part")
	BlockMesh164 = Instance.new("BlockMesh")
	Part165 = Instance.new("Part")
	BlockMesh166 = Instance.new("BlockMesh")
	Part167 = Instance.new("Part")
	BlockMesh168 = Instance.new("BlockMesh")
	Part169 = Instance.new("Part")
	BlockMesh170 = Instance.new("BlockMesh")
	Part171 = Instance.new("Part")
	BlockMesh172 = Instance.new("BlockMesh")
	Part173 = Instance.new("Part")
	BlockMesh174 = Instance.new("BlockMesh")
	Part175 = Instance.new("Part")
	BlockMesh176 = Instance.new("BlockMesh")
	Part177 = Instance.new("Part")
	BlockMesh178 = Instance.new("BlockMesh")
	Part179 = Instance.new("Part")
	BlockMesh180 = Instance.new("BlockMesh")
	Part181 = Instance.new("Part")
	BlockMesh182 = Instance.new("BlockMesh")
	Part183 = Instance.new("Part")
	BlockMesh184 = Instance.new("BlockMesh")
	Part185 = Instance.new("Part")
	BlockMesh186 = Instance.new("BlockMesh")
	Part187 = Instance.new("Part")
	BlockMesh188 = Instance.new("BlockMesh")
	Part189 = Instance.new("Part")
	BlockMesh190 = Instance.new("BlockMesh")
	Part191 = Instance.new("Part")
	BlockMesh192 = Instance.new("BlockMesh")
	Part193 = Instance.new("Part")
	BlockMesh194 = Instance.new("BlockMesh")
	Part195 = Instance.new("Part")
	BlockMesh196 = Instance.new("BlockMesh")
	Part197 = Instance.new("Part")
	BlockMesh198 = Instance.new("BlockMesh")
	Part199 = Instance.new("Part")
	BlockMesh200 = Instance.new("BlockMesh")
	Part201 = Instance.new("Part")
	BlockMesh202 = Instance.new("BlockMesh")
	Part203 = Instance.new("Part")
	BlockMesh204 = Instance.new("BlockMesh")
	Part205 = Instance.new("Part")
	BlockMesh206 = Instance.new("BlockMesh")
	Part207 = Instance.new("Part")
	BlockMesh208 = Instance.new("BlockMesh")
	Part209 = Instance.new("Part")
	BlockMesh210 = Instance.new("BlockMesh")
	Part211 = Instance.new("Part")
	BlockMesh212 = Instance.new("BlockMesh")
	Part213 = Instance.new("Part")
	BlockMesh214 = Instance.new("BlockMesh")
	Part215 = Instance.new("Part")
	BlockMesh216 = Instance.new("BlockMesh")
	Part217 = Instance.new("Part")
	BlockMesh218 = Instance.new("BlockMesh")
	Part219 = Instance.new("Part")
	BlockMesh220 = Instance.new("BlockMesh")
	Part221 = Instance.new("Part")
	BlockMesh222 = Instance.new("BlockMesh")
	Part223 = Instance.new("Part")
	BlockMesh224 = Instance.new("BlockMesh")
	Part225 = Instance.new("Part")
	BlockMesh226 = Instance.new("BlockMesh")
	Part227 = Instance.new("Part")
	BlockMesh228 = Instance.new("BlockMesh")
	Part229 = Instance.new("Part")
	BlockMesh230 = Instance.new("BlockMesh")
	Part231 = Instance.new("Part")
	BlockMesh232 = Instance.new("BlockMesh")
	Part233 = Instance.new("Part")
	BlockMesh234 = Instance.new("BlockMesh")
	Part235 = Instance.new("Part")
	BlockMesh236 = Instance.new("BlockMesh")
	Part237 = Instance.new("Part")
	BlockMesh238 = Instance.new("BlockMesh")
	Part239 = Instance.new("Part")
	BlockMesh240 = Instance.new("BlockMesh")
	Part241 = Instance.new("Part")
	BlockMesh242 = Instance.new("BlockMesh")
	Part243 = Instance.new("Part")
	BlockMesh244 = Instance.new("BlockMesh")
	Part245 = Instance.new("Part")
	BlockMesh246 = Instance.new("BlockMesh")
	Part247 = Instance.new("Part")
	BlockMesh248 = Instance.new("BlockMesh")
	Part249 = Instance.new("Part")
	BlockMesh250 = Instance.new("BlockMesh")
	Part251 = Instance.new("Part")
	BlockMesh252 = Instance.new("BlockMesh")
	Part253 = Instance.new("Part")
	BlockMesh254 = Instance.new("BlockMesh")
	Part255 = Instance.new("Part")
	BlockMesh256 = Instance.new("BlockMesh")
	Part257 = Instance.new("Part")
	BlockMesh258 = Instance.new("BlockMesh")
	Part259 = Instance.new("Part")
	BlockMesh260 = Instance.new("BlockMesh")
	Part261 = Instance.new("Part")
	BlockMesh262 = Instance.new("BlockMesh")
	Part263 = Instance.new("Part")
	BlockMesh264 = Instance.new("BlockMesh")
	Part265 = Instance.new("Part")
	BlockMesh266 = Instance.new("BlockMesh")
	Part267 = Instance.new("Part")
	BlockMesh268 = Instance.new("BlockMesh")
	Part269 = Instance.new("Part")
	BlockMesh270 = Instance.new("BlockMesh")
	Part271 = Instance.new("Part")
	BlockMesh272 = Instance.new("BlockMesh")
	Part273 = Instance.new("Part")
	BlockMesh274 = Instance.new("BlockMesh")
	Part275 = Instance.new("Part")
	BlockMesh276 = Instance.new("BlockMesh")
	Part277 = Instance.new("Part")
	BlockMesh278 = Instance.new("BlockMesh")
	Model279 = Instance.new("Model")
	Model280 = Instance.new("Model")
	Model281 = Instance.new("Model")
	Part282 = Instance.new("Part")
	Part283 = Instance.new("Part")
	Part284 = Instance.new("Part")
	Part285 = Instance.new("Part")
	Model286 = Instance.new("Model")
	Part287 = Instance.new("Part")
	BlockMesh288 = Instance.new("BlockMesh")
	Part289 = Instance.new("Part")
	BlockMesh290 = Instance.new("BlockMesh")
	Part291 = Instance.new("Part")
	BlockMesh292 = Instance.new("BlockMesh")
	Part293 = Instance.new("Part")
	BlockMesh294 = Instance.new("BlockMesh")
	Part295 = Instance.new("Part")
	BlockMesh296 = Instance.new("BlockMesh")
	Part297 = Instance.new("Part")
	BlockMesh298 = Instance.new("BlockMesh")
	Model299 = Instance.new("Model")
	Model300 = Instance.new("Model")
	Part301 = Instance.new("Part")
	BlockMesh302 = Instance.new("BlockMesh")
	Part303 = Instance.new("Part")
	BlockMesh304 = Instance.new("BlockMesh")
	Part305 = Instance.new("Part")
	BlockMesh306 = Instance.new("BlockMesh")
	Part307 = Instance.new("Part")
	BlockMesh308 = Instance.new("BlockMesh")
	Part309 = Instance.new("Part")
	BlockMesh310 = Instance.new("BlockMesh")
	Part311 = Instance.new("Part")
	BlockMesh312 = Instance.new("BlockMesh")
	Model313 = Instance.new("Model")
	Part314 = Instance.new("Part")
	Part315 = Instance.new("Part")
	Part316 = Instance.new("Part")
	Part317 = Instance.new("Part")
	Model318 = Instance.new("Model")
	Model319 = Instance.new("Model")
	Model320 = Instance.new("Model")
	Part321 = Instance.new("Part")
	BlockMesh322 = Instance.new("BlockMesh")
	Part323 = Instance.new("Part")
	BlockMesh324 = Instance.new("BlockMesh")
	Part325 = Instance.new("Part")
	BlockMesh326 = Instance.new("BlockMesh")
	Part327 = Instance.new("Part")
	BlockMesh328 = Instance.new("BlockMesh")
	Part329 = Instance.new("Part")
	BlockMesh330 = Instance.new("BlockMesh")
	Part331 = Instance.new("Part")
	BlockMesh332 = Instance.new("BlockMesh")
	Model333 = Instance.new("Model")
	Part334 = Instance.new("Part")
	Part335 = Instance.new("Part")
	Part336 = Instance.new("Part")
	Part337 = Instance.new("Part")
	Model338 = Instance.new("Model")
	Model339 = Instance.new("Model")
	Part340 = Instance.new("Part")
	Part341 = Instance.new("Part")
	Part342 = Instance.new("Part")
	Part343 = Instance.new("Part")
	Model344 = Instance.new("Model")
	Part345 = Instance.new("Part")
	BlockMesh346 = Instance.new("BlockMesh")
	Part347 = Instance.new("Part")
	BlockMesh348 = Instance.new("BlockMesh")
	Part349 = Instance.new("Part")
	BlockMesh350 = Instance.new("BlockMesh")
	Part351 = Instance.new("Part")
	BlockMesh352 = Instance.new("BlockMesh")
	Part353 = Instance.new("Part")
	BlockMesh354 = Instance.new("BlockMesh")
	Part355 = Instance.new("Part")
	BlockMesh356 = Instance.new("BlockMesh")
	Model357 = Instance.new("Model")
	Model358 = Instance.new("Model")
	Model359 = Instance.new("Model")
	Part360 = Instance.new("Part")
	BlockMesh361 = Instance.new("BlockMesh")
	Part362 = Instance.new("Part")
	BlockMesh363 = Instance.new("BlockMesh")
	Part364 = Instance.new("Part")
	BlockMesh365 = Instance.new("BlockMesh")
	Part366 = Instance.new("Part")
	BlockMesh367 = Instance.new("BlockMesh")
	Part368 = Instance.new("Part")
	BlockMesh369 = Instance.new("BlockMesh")
	Part370 = Instance.new("Part")
	BlockMesh371 = Instance.new("BlockMesh")
	Model372 = Instance.new("Model")
	Part373 = Instance.new("Part")
	Part374 = Instance.new("Part")
	Part375 = Instance.new("Part")
	Part376 = Instance.new("Part")
	Model377 = Instance.new("Model")
	Model378 = Instance.new("Model")
	Part379 = Instance.new("Part")
	Part380 = Instance.new("Part")
	Part381 = Instance.new("Part")
	Part382 = Instance.new("Part")
	Model383 = Instance.new("Model")
	Part384 = Instance.new("Part")
	BlockMesh385 = Instance.new("BlockMesh")
	Part386 = Instance.new("Part")
	BlockMesh387 = Instance.new("BlockMesh")
	Part388 = Instance.new("Part")
	BlockMesh389 = Instance.new("BlockMesh")
	Part390 = Instance.new("Part")
	BlockMesh391 = Instance.new("BlockMesh")
	Part392 = Instance.new("Part")
	BlockMesh393 = Instance.new("BlockMesh")
	Part394 = Instance.new("Part")
	BlockMesh395 = Instance.new("BlockMesh")
	Model0.Parent = char
	Model0.Name = "WingsModel"
	Model1.Name = "center"
	Model1.Parent = Model0
	Model2.Name = "a"
	Model2.Parent = Model1
	Part3.Parent = Model2
	Part3.Rotation = Vector3.new(0, -40, 0)
	Part3.Anchored = true
	Part3.CanCollide = false
	Part3.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part3.CFrame = CFrame.new(20.478632, 0.458999991, -28.4852867, 0.766044319, 0, -0.642787755, 0, 1, 0, 0.642787755, 0, 0.766044319)
	Part3.BottomSurface = Enum.SurfaceType.Smooth
	Part3.TopSurface = Enum.SurfaceType.Smooth
	Part3.Position = Vector3.new(20.478632, 0.458999991, -28.4852867)
	Part3.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part4.Parent = Model2
	Part4.Rotation = Vector3.new(-180, -75, -180)
	Part4.Anchored = true
	Part4.CanCollide = false
	Part4.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part4.CFrame = CFrame.new(20.6078491, 0.458999991, -27.0657635, -0.258819103, 0, -0.965925813, 0, 1, 0, 0.965925813, 0, -0.258819103)
	Part4.BottomSurface = Enum.SurfaceType.Smooth
	Part4.TopSurface = Enum.SurfaceType.Smooth
	Part4.Position = Vector3.new(20.6078491, 0.458999991, -27.0657635)
	Part4.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part5.Parent = Model2
	Part5.Rotation = Vector3.new(0, -35, 0)
	Part5.Anchored = true
	Part5.CanCollide = false
	Part5.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part5.CFrame = CFrame.new(20.1699867, 0.458999991, -28.2687798, 0.819152176, 0, -0.573576331, 0, 1, 0, 0.573576331, 0, 0.819152176)
	Part5.BottomSurface = Enum.SurfaceType.Smooth
	Part5.TopSurface = Enum.SurfaceType.Smooth
	Part5.Position = Vector3.new(20.1699867, 0.458999991, -28.2687798)
	Part5.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part6.Parent = Model2
	Part6.Rotation = Vector3.new(0, -20, 0)
	Part6.Anchored = true
	Part6.CanCollide = false
	Part6.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part6.CFrame = CFrame.new(20.0346985, 0.458999991, -28.7415924, 0.939692557, 0, -0.342020363, 0, 1, 0, 0.342020363, 0, 0.939692557)
	Part6.BottomSurface = Enum.SurfaceType.Smooth
	Part6.TopSurface = Enum.SurfaceType.Smooth
	Part6.Position = Vector3.new(20.0346985, 0.458999991, -28.7415924)
	Part6.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part7.Parent = Model2
	Part7.Rotation = Vector3.new(0, -5, 0)
	Part7.Anchored = true
	Part7.CanCollide = false
	Part7.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part7.CFrame = CFrame.new(19.6585178, 0.458999991, -28.8249893, 0.99619472, 0, -0.0871555507, 0, 1, 0, 0.0871555507, 0, 0.99619472)
	Part7.BottomSurface = Enum.SurfaceType.Smooth
	Part7.TopSurface = Enum.SurfaceType.Smooth
	Part7.Position = Vector3.new(19.6585178, 0.458999991, -28.8249893)
	Part7.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part8.Parent = Model2
	Part8.Rotation = Vector3.new(-180, -70, -180)
	Part8.Anchored = true
	Part8.CanCollide = false
	Part8.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part8.CFrame = CFrame.new(20.5785732, 0.458999991, -26.9729118, -0.342020154, 0, -0.939692557, 0, 1, 0, 0.939692557, 0, -0.342020154)
	Part8.BottomSurface = Enum.SurfaceType.Smooth
	Part8.TopSurface = Enum.SurfaceType.Smooth
	Part8.Position = Vector3.new(20.5785732, 0.458999991, -26.9729118)
	Part8.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part9.Parent = Model2
	Part9.Rotation = Vector3.new(-180, -50, -180)
	Part9.Anchored = true
	Part9.CanCollide = false
	Part9.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part9.CFrame = CFrame.new(20.6605587, 0.458999991, -26.4058514, -0.642787576, 0, -0.766044378, 0, 1, 0, 0.766044378, 0, -0.642787576)
	Part9.BottomSurface = Enum.SurfaceType.Smooth
	Part9.TopSurface = Enum.SurfaceType.Smooth
	Part9.Position = Vector3.new(20.6605587, 0.458999991, -26.4058514)
	Part9.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part10.Parent = Model2
	Part10.Anchored = true
	Part10.CanCollide = false
	Part10.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part10.CFrame = CFrame.new(19.5298767, 0.458999991, -28.4706059, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part10.BottomSurface = Enum.SurfaceType.Smooth
	Part10.TopSurface = Enum.SurfaceType.Smooth
	Part10.Position = Vector3.new(19.5298767, 0.458999991, -28.4706059)
	Part10.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part11.Parent = Model2
	Part11.Rotation = Vector3.new(-180, -85, -180)
	Part11.Anchored = true
	Part11.CanCollide = false
	Part11.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part11.CFrame = CFrame.new(21.0002594, 0.458999991, -27.2259636, -0.0871553719, 0, -0.99619472, 0, 1, 0, 0.99619472, 0, -0.0871553719)
	Part11.BottomSurface = Enum.SurfaceType.Smooth
	Part11.TopSurface = Enum.SurfaceType.Smooth
	Part11.Position = Vector3.new(21.0002594, 0.458999991, -27.2259636)
	Part11.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part12.Parent = Model2
	Part12.Rotation = Vector3.new(-180, -80, -180)
	Part12.Anchored = true
	Part12.CanCollide = false
	Part12.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part12.CFrame = CFrame.new(20.9834518, 0.458999991, -27.0983009, -0.173648432, 0, -0.98480767, 0, 1, 0, 0.98480767, 0, -0.173648432)
	Part12.BottomSurface = Enum.SurfaceType.Smooth
	Part12.TopSurface = Enum.SurfaceType.Smooth
	Part12.Position = Vector3.new(20.9834518, 0.458999991, -27.0983009)
	Part12.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part13.Parent = Model2
	Part13.Rotation = Vector3.new(0, -15, 0)
	Part13.Anchored = true
	Part13.CanCollide = false
	Part13.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part13.CFrame = CFrame.new(19.818718, 0.458999991, -28.432579, 0.965925932, 0, -0.258818656, 0, 1, 0, 0.258818656, 0, 0.965925932)
	Part13.BottomSurface = Enum.SurfaceType.Smooth
	Part13.TopSurface = Enum.SurfaceType.Smooth
	Part13.Position = Vector3.new(19.818718, 0.458999991, -28.432579)
	Part13.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part14.Parent = Model2
	Part14.Rotation = Vector3.new(-180, -30, -180)
	Part14.Anchored = true
	Part14.CanCollide = false
	Part14.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part14.CFrame = CFrame.new(20.2678757, 0.458999991, -26.0763512, -0.866025388, 0, -0.499999762, 0, 1, 0, 0.499999762, 0, -0.866025388)
	Part14.BottomSurface = Enum.SurfaceType.Smooth
	Part14.TopSurface = Enum.SurfaceType.Smooth
	Part14.Position = Vector3.new(20.2678757, 0.458999991, -26.0763512)
	Part14.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part15.Parent = Model2
	Part15.Rotation = Vector3.new(0, -25, 0)
	Part15.Anchored = true
	Part15.CanCollide = false
	Part15.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part15.CFrame = CFrame.new(20.0015182, 0.458999991, -28.3660469, 0.906307757, 0, -0.42261827, 0, 1, 0, 0.42261827, 0, 0.906307757)
	Part15.BottomSurface = Enum.SurfaceType.Smooth
	Part15.TopSurface = Enum.SurfaceType.Smooth
	Part15.Position = Vector3.new(20.0015182, 0.458999991, -28.3660469)
	Part15.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part16.Parent = Model2
	Part16.Rotation = Vector3.new(0, -45, 0)
	Part16.Anchored = true
	Part16.CanCollide = false
	Part16.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part16.CFrame = CFrame.new(20.3190079, 0.458999991, -28.1437378, 0.707106769, 0, -0.707106769, 0, 1, 0, 0.707106769, 0, 0.707106769)
	Part16.BottomSurface = Enum.SurfaceType.Smooth
	Part16.TopSurface = Enum.SurfaceType.Smooth
	Part16.Position = Vector3.new(20.3190079, 0.458999991, -28.1437378)
	Part16.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part17.Parent = Model2
	Part17.Rotation = Vector3.new(-180, -50, -180)
	Part17.Anchored = true
	Part17.CanCollide = false
	Part17.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part17.CFrame = CFrame.new(20.3847828, 0.458999991, -26.6372528, -0.642787576, 0, -0.766044378, 0, 1, 0, 0.766044378, 0, -0.642787576)
	Part17.BottomSurface = Enum.SurfaceType.Smooth
	Part17.TopSurface = Enum.SurfaceType.Smooth
	Part17.Position = Vector3.new(20.3847828, 0.458999991, -26.6372528)
	Part17.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part18.Parent = Model2
	Part18.Rotation = Vector3.new(0, -10, 0)
	Part18.Anchored = true
	Part18.CanCollide = false
	Part18.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part18.CFrame = CFrame.new(19.7861805, 0.458999991, -28.8081818, 0.984807789, 0, -0.17364797, 0, 1, 0, 0.17364797, 0, 0.984807789)
	Part18.BottomSurface = Enum.SurfaceType.Smooth
	Part18.TopSurface = Enum.SurfaceType.Smooth
	Part18.Position = Vector3.new(19.7861805, 0.458999991, -28.8081818)
	Part18.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part19.Parent = Model2
	Part19.Rotation = Vector3.new(-180, -35, -180)
	Part19.Anchored = true
	Part19.CanCollide = false
	Part19.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part19.CFrame = CFrame.new(20.3764744, 0.458999991, -26.1455364, -0.819152117, 0, -0.573576212, 0, 1, 0, 0.573576212, 0, -0.819152117)
	Part19.BottomSurface = Enum.SurfaceType.Smooth
	Part19.TopSurface = Enum.SurfaceType.Smooth
	Part19.Position = Vector3.new(20.3764744, 0.458999991, -26.1455364)
	Part19.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part20.Name = "asd"
	Part20.Parent = Model2
	Part20.Transparency = 1
	Part20.Anchored = true
	Part20.CanCollide = false
	Part20.Size = Vector3.new(0.179999992, 0.179999992, 0.179999992)
	Part20.CFrame = CFrame.new(19.5298767, 0.458999991, -27.3546066, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part20.BottomSurface = Enum.SurfaceType.Smooth
	Part20.TopSurface = Enum.SurfaceType.Smooth
	Part20.Position = Vector3.new(19.5298767, 0.458999991, -27.3546066)
	Part20.Color = Color3.new(1, 0, 0)
	Part21.Parent = Model2
	Part21.Rotation = Vector3.new(0, -80, 0)
	Part21.Anchored = true
	Part21.CanCollide = false
	Part21.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part21.CFrame = CFrame.new(20.9834518, 0.458999991, -27.6109104, 0.173648149, 0, -0.98480773, 0, 1, 0, 0.98480773, 0, 0.173648149)
	Part21.BottomSurface = Enum.SurfaceType.Smooth
	Part21.TopSurface = Enum.SurfaceType.Smooth
	Part21.Position = Vector3.new(20.9834518, 0.458999991, -27.6109104)
	Part21.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part22.Parent = Model2
	Part22.Rotation = Vector3.new(0, -35, 0)
	Part22.Anchored = true
	Part22.CanCollide = false
	Part22.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part22.CFrame = CFrame.new(20.3764744, 0.458999991, -28.5636749, 0.819152176, 0, -0.573576331, 0, 1, 0, 0.573576331, 0, 0.819152176)
	Part22.BottomSurface = Enum.SurfaceType.Smooth
	Part22.TopSurface = Enum.SurfaceType.Smooth
	Part22.Position = Vector3.new(20.3764744, 0.458999991, -28.5636749)
	Part22.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part23.Parent = Model2
	Part23.Anchored = true
	Part23.CanCollide = false
	Part23.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part23.CFrame = CFrame.new(19.5298767, 0.458999991, -28.8306046, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part23.BottomSurface = Enum.SurfaceType.Smooth
	Part23.TopSurface = Enum.SurfaceType.Smooth
	Part23.Position = Vector3.new(19.5298767, 0.458999991, -28.8306046)
	Part23.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part24.Parent = Model2
	Part24.Rotation = Vector3.new(0, -40, 0)
	Part24.Anchored = true
	Part24.CanCollide = false
	Part24.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part24.CFrame = CFrame.new(20.2472267, 0.458999991, -28.2095127, 0.766044319, 0, -0.642787755, 0, 1, 0, 0.642787755, 0, 0.766044319)
	Part24.BottomSurface = Enum.SurfaceType.Smooth
	Part24.TopSurface = Enum.SurfaceType.Smooth
	Part24.Position = Vector3.new(20.2472267, 0.458999991, -28.2095127)
	Part24.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part25.Parent = Model2
	Part25.Rotation = Vector3.new(-180, -65, -180)
	Part25.Anchored = true
	Part25.CanCollide = false
	Part25.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part25.CFrame = CFrame.new(20.8675861, 0.458999991, -26.7308216, -0.422618151, 0, -0.906307876, 0, 1, 0, 0.906307876, 0, -0.422618151)
	Part25.BottomSurface = Enum.SurfaceType.Smooth
	Part25.TopSurface = Enum.SurfaceType.Smooth
	Part25.Position = Vector3.new(20.8675861, 0.458999991, -26.7308216)
	Part25.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part26.Parent = Model2
	Part26.Rotation = Vector3.new(0, -5, 0)
	Part26.Anchored = true
	Part26.CanCollide = false
	Part26.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part26.CFrame = CFrame.new(19.627142, 0.458999991, -28.4663601, 0.99619472, 0, -0.0871555507, 0, 1, 0, 0.0871555507, 0, 0.99619472)
	Part26.BottomSurface = Enum.SurfaceType.Smooth
	Part26.TopSurface = Enum.SurfaceType.Smooth
	Part26.Position = Vector3.new(19.627142, 0.458999991, -28.4663601)
	Part26.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part27.Parent = Model2
	Part27.Rotation = Vector3.new(0, -70, 0)
	Part27.Anchored = true
	Part27.CanCollide = false
	Part27.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part27.CFrame = CFrame.new(20.5785732, 0.458999991, -27.7362995, 0.342019945, 0, -0.939692616, 0, 1, 0, 0.939692616, 0, 0.342019945)
	Part27.BottomSurface = Enum.SurfaceType.Smooth
	Part27.TopSurface = Enum.SurfaceType.Smooth
	Part27.Position = Vector3.new(20.5785732, 0.458999991, -27.7362995)
	Part27.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part28.Parent = Model2
	Part28.Rotation = Vector3.new(-180, -80, -180)
	Part28.Anchored = true
	Part28.CanCollide = false
	Part28.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part28.CFrame = CFrame.new(20.6289215, 0.458999991, -27.1608143, -0.173648432, 0, -0.98480767, 0, 1, 0, 0.98480767, 0, -0.173648432)
	Part28.BottomSurface = Enum.SurfaceType.Smooth
	Part28.TopSurface = Enum.SurfaceType.Smooth
	Part28.Position = Vector3.new(20.6289215, 0.458999991, -27.1608143)
	Part28.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part29.Parent = Model2
	Part29.Rotation = Vector3.new(0, -70, 0)
	Part29.Anchored = true
	Part29.CanCollide = false
	Part29.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part29.CFrame = CFrame.new(20.9168625, 0.458999991, -27.8594284, 0.342019945, 0, -0.939692616, 0, 1, 0, 0.939692616, 0, 0.342019945)
	Part29.BottomSurface = Enum.SurfaceType.Smooth
	Part29.TopSurface = Enum.SurfaceType.Smooth
	Part29.Position = Vector3.new(20.9168625, 0.458999991, -27.8594284)
	Part29.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part30.Parent = Model2
	Part30.Rotation = Vector3.new(0, -60, 0)
	Part30.Anchored = true
	Part30.CanCollide = false
	Part30.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part30.CFrame = CFrame.new(20.4963608, 0.458999991, -27.9126072, 0.499999642, 0, -0.866025627, 0, 1, 0, 0.866025627, 0, 0.499999642)
	Part30.BottomSurface = Enum.SurfaceType.Smooth
	Part30.TopSurface = Enum.SurfaceType.Smooth
	Part30.Position = Vector3.new(20.4963608, 0.458999991, -27.9126072)
	Part30.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part31.Parent = Model2
	Part31.Rotation = Vector3.new(0, -65, 0)
	Part31.Anchored = true
	Part31.CanCollide = false
	Part31.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part31.CFrame = CFrame.new(20.5413151, 0.458999991, -27.8262482, 0.422618061, 0, -0.906307817, 0, 1, 0, 0.906307817, 0, 0.422618061)
	Part31.BottomSurface = Enum.SurfaceType.Smooth
	Part31.TopSurface = Enum.SurfaceType.Smooth
	Part31.Position = Vector3.new(20.5413151, 0.458999991, -27.8262482)
	Part31.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part32.Parent = Model2
	Part32.Rotation = Vector3.new(0, -55, 0)
	Part32.Anchored = true
	Part32.CanCollide = false
	Part32.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part32.CFrame = CFrame.new(20.7389431, 0.458999991, -28.2012062, 0.573576629, 0, -0.819151938, 0, 1, 0, 0.819151938, 0, 0.573576629)
	Part32.BottomSurface = Enum.SurfaceType.Smooth
	Part32.TopSurface = Enum.SurfaceType.Smooth
	Part32.Position = Vector3.new(20.7389431, 0.458999991, -28.2012062)
	Part32.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part33.Parent = Model2
	Part33.Rotation = Vector3.new(-180, -60, -180)
	Part33.Anchored = true
	Part33.CanCollide = false
	Part33.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part33.CFrame = CFrame.new(20.8081303, 0.458999991, -26.6166058, -0.500000179, 0, -0.866025329, 0, 1, 0, 0.866025329, 0, -0.500000179)
	Part33.BottomSurface = Enum.SurfaceType.Smooth
	Part33.TopSurface = Enum.SurfaceType.Smooth
	Part33.Position = Vector3.new(20.8081303, 0.458999991, -26.6166058)
	Part33.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part34.Parent = Model2
	Part34.Rotation = Vector3.new(0, -50, 0)
	Part34.Anchored = true
	Part34.CanCollide = false
	Part34.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part34.CFrame = CFrame.new(20.6605587, 0.458999991, -28.30336, 0.642787576, 0, -0.766044378, 0, 1, 0, 0.766044378, 0, 0.642787576)
	Part34.BottomSurface = Enum.SurfaceType.Smooth
	Part34.TopSurface = Enum.SurfaceType.Smooth
	Part34.Position = Vector3.new(20.6605587, 0.458999991, -28.30336)
	Part34.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part35.Parent = Model2
	Part35.Rotation = Vector3.new(0, -75, 0)
	Part35.Anchored = true
	Part35.CanCollide = false
	Part35.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part35.CFrame = CFrame.new(20.6078491, 0.458999991, -27.6434479, 0.258819014, 0, -0.965925872, 0, 1, 0, 0.965925872, 0, 0.258819014)
	Part35.BottomSurface = Enum.SurfaceType.Smooth
	Part35.TopSurface = Enum.SurfaceType.Smooth
	Part35.Position = Vector3.new(20.6078491, 0.458999991, -27.6434479)
	Part35.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part36.Parent = Model2
	Part36.Rotation = Vector3.new(-180, -35, -180)
	Part36.Anchored = true
	Part36.CanCollide = false
	Part36.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part36.CFrame = CFrame.new(20.1699867, 0.458999991, -26.4404316, -0.819152117, 0, -0.573576212, 0, 1, 0, 0.573576212, 0, -0.819152117)
	Part36.BottomSurface = Enum.SurfaceType.Smooth
	Part36.TopSurface = Enum.SurfaceType.Smooth
	Part36.Position = Vector3.new(20.1699867, 0.458999991, -26.4404316)
	Part36.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part37.Parent = Model2
	Part37.Rotation = Vector3.new(0, -15, 0)
	Part37.Anchored = true
	Part37.CanCollide = false
	Part37.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part37.CFrame = CFrame.new(19.9118938, 0.458999991, -28.7803116, 0.965925932, 0, -0.258818656, 0, 1, 0, 0.258818656, 0, 0.965925932)
	Part37.BottomSurface = Enum.SurfaceType.Smooth
	Part37.TopSurface = Enum.SurfaceType.Smooth
	Part37.Position = Vector3.new(19.9118938, 0.458999991, -28.7803116)
	Part37.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part38.Parent = Model2
	Part38.Rotation = Vector3.new(0, -55, 0)
	Part38.Anchored = true
	Part38.CanCollide = false
	Part38.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part38.CFrame = CFrame.new(20.4440498, 0.458999991, -27.9947166, 0.573576629, 0, -0.819151938, 0, 1, 0, 0.819151938, 0, 0.573576629)
	Part38.BottomSurface = Enum.SurfaceType.Smooth
	Part38.TopSurface = Enum.SurfaceType.Smooth
	Part38.Position = Vector3.new(20.4440498, 0.458999991, -27.9947166)
	Part38.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part39.Parent = Model2
	Part39.Rotation = Vector3.new(-180, -30, -180)
	Part39.Anchored = true
	Part39.CanCollide = false
	Part39.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part39.CFrame = CFrame.new(20.0878754, 0.458999991, -26.3881226, -0.866025388, 0, -0.499999762, 0, 1, 0, 0.499999762, 0, -0.866025388)
	Part39.BottomSurface = Enum.SurfaceType.Smooth
	Part39.TopSurface = Enum.SurfaceType.Smooth
	Part39.Position = Vector3.new(20.0878754, 0.458999991, -26.3881226)
	Part39.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part40.Parent = Model2
	Part40.Rotation = Vector3.new(-180, -25, -180)
	Part40.Anchored = true
	Part40.CanCollide = false
	Part40.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part40.CFrame = CFrame.new(20.0015182, 0.458999991, -26.3431644, -0.906307817, 0, -0.42261821, 0, 1, 0, 0.42261821, 0, -0.906307817)
	Part40.BottomSurface = Enum.SurfaceType.Smooth
	Part40.TopSurface = Enum.SurfaceType.Smooth
	Part40.Position = Vector3.new(20.0015182, 0.458999991, -26.3431644)
	Part40.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part41.Parent = Model2
	Part41.Rotation = Vector3.new(-180, -65, -180)
	Part41.Anchored = true
	Part41.CanCollide = false
	Part41.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part41.CFrame = CFrame.new(20.5413151, 0.458999991, -26.8829651, -0.422618151, 0, -0.906307876, 0, 1, 0, 0.906307876, 0, -0.422618151)
	Part41.BottomSurface = Enum.SurfaceType.Smooth
	Part41.TopSurface = Enum.SurfaceType.Smooth
	Part41.Position = Vector3.new(20.5413151, 0.458999991, -26.8829651)
	Part41.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part42.Parent = Model2
	Part42.Rotation = Vector3.new(0, -85, 0)
	Part42.Anchored = true
	Part42.CanCollide = false
	Part42.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part42.CFrame = CFrame.new(20.6416283, 0.458999991, -27.45187, 0.0871559083, 0, -0.996194661, 0, 1, 0, 0.996194661, 0, 0.0871559083)
	Part42.BottomSurface = Enum.SurfaceType.Smooth
	Part42.TopSurface = Enum.SurfaceType.Smooth
	Part42.Position = Vector3.new(20.6416283, 0.458999991, -27.45187)
	Part42.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part43.Parent = Model2
	Part43.Rotation = Vector3.new(0, -89.9799957, 0)
	Part43.Anchored = true
	Part43.CanCollide = false
	Part43.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part43.CFrame = CFrame.new(20.6458759, 0.458999991, -27.3546066, 1.78813934E-7, 0, -0.99999994, 0, 1, 0, 0.99999994, 0, 1.78813934E-7)
	Part43.BottomSurface = Enum.SurfaceType.Smooth
	Part43.TopSurface = Enum.SurfaceType.Smooth
	Part43.Position = Vector3.new(20.6458759, 0.458999991, -27.3546066)
	Part43.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part44.Parent = Model2
	Part44.Rotation = Vector3.new(-180, -40, -180)
	Part44.Anchored = true
	Part44.CanCollide = false
	Part44.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part44.CFrame = CFrame.new(20.2472267, 0.458999991, -26.4996986, -0.766044736, 0, -0.642787218, 0, 1, 0, 0.642787218, 0, -0.766044736)
	Part44.BottomSurface = Enum.SurfaceType.Smooth
	Part44.TopSurface = Enum.SurfaceType.Smooth
	Part44.Position = Vector3.new(20.2472267, 0.458999991, -26.4996986)
	Part44.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part45.Parent = Model2
	Part45.Rotation = Vector3.new(0, -60, 0)
	Part45.Anchored = true
	Part45.CanCollide = false
	Part45.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part45.CFrame = CFrame.new(20.8081303, 0.458999991, -28.0926056, 0.499999642, 0, -0.866025627, 0, 1, 0, 0.866025627, 0, 0.499999642)
	Part45.BottomSurface = Enum.SurfaceType.Smooth
	Part45.TopSurface = Enum.SurfaceType.Smooth
	Part45.Position = Vector3.new(20.8081303, 0.458999991, -28.0926056)
	Part45.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part46.Parent = Model2
	Part46.Rotation = Vector3.new(0, -20, 0)
	Part46.Anchored = true
	Part46.CanCollide = false
	Part46.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part46.CFrame = CFrame.new(19.9115696, 0.458999991, -28.4033051, 0.939692557, 0, -0.342020363, 0, 1, 0, 0.342020363, 0, 0.939692557)
	Part46.BottomSurface = Enum.SurfaceType.Smooth
	Part46.TopSurface = Enum.SurfaceType.Smooth
	Part46.Position = Vector3.new(19.9115696, 0.458999991, -28.4033051)
	Part46.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part47.Parent = Model2
	Part47.Rotation = Vector3.new(0, -75, 0)
	Part47.Anchored = true
	Part47.CanCollide = false
	Part47.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part47.CFrame = CFrame.new(20.9555817, 0.458999991, -27.7366219, 0.258819014, 0, -0.965925872, 0, 1, 0, 0.965925872, 0, 0.258819014)
	Part47.BottomSurface = Enum.SurfaceType.Smooth
	Part47.TopSurface = Enum.SurfaceType.Smooth
	Part47.Position = Vector3.new(20.9555817, 0.458999991, -27.7366219)
	Part47.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part48.Parent = Model2
	Part48.Rotation = Vector3.new(90, 0, -174.039993)
	Part48.Anchored = true
	Part48.CanCollide = false
	Part48.Size = Vector3.new(0.383828521, 0.108000003, 0.108000003)
	Part48.CFrame = CFrame.new(19.9096489, 0.458999991, -26.0035667, -0.994587779, 0.103899181, 0, 0, 0, -1, -0.103899181, -0.994587779, 0)
	Part48.BottomSurface = Enum.SurfaceType.Smooth
	Part48.TopSurface = Enum.SurfaceType.Smooth
	Part48.Position = Vector3.new(19.9096489, 0.458999991, -26.0035667)
	Part48.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part49.Parent = Model2
	Part49.Anchored = true
	Part49.CanCollide = false
	Part49.Size = Vector3.new(0.0629999638, 0.108000003, 0.0989999548)
	Part49.CFrame = CFrame.new(19.1563759, 0.458999991, -28.6506062, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part49.BottomSurface = Enum.SurfaceType.Smooth
	Part49.TopSurface = Enum.SurfaceType.Smooth
	Part49.Position = Vector3.new(19.1563759, 0.458999991, -28.6506062)
	Part49.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part50.Parent = Model2
	Part50.Rotation = Vector3.new(0, -80, 0)
	Part50.Anchored = true
	Part50.CanCollide = false
	Part50.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part50.CFrame = CFrame.new(20.6289215, 0.458999991, -27.5483971, 0.173648149, 0, -0.98480773, 0, 1, 0, 0.98480773, 0, 0.173648149)
	Part50.BottomSurface = Enum.SurfaceType.Smooth
	Part50.TopSurface = Enum.SurfaceType.Smooth
	Part50.Position = Vector3.new(20.6289215, 0.458999991, -27.5483971)
	Part50.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part51.Parent = Model2
	Part51.Rotation = Vector3.new(90, 0, -55.9599991)
	Part51.Anchored = true
	Part51.CanCollide = false
	Part51.Size = Vector3.new(0.383828819, 0.108000003, 0.108000003)
	Part51.CFrame = CFrame.new(19.8344593, 0.458999991, -26.1648102, 0.559716702, 0.828684032, 0, 0, 0, -1, -0.828684032, 0.559716702, 0)
	Part51.BottomSurface = Enum.SurfaceType.Smooth
	Part51.TopSurface = Enum.SurfaceType.Smooth
	Part51.Position = Vector3.new(19.8344593, 0.458999991, -26.1648102)
	Part51.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part52.Parent = Model2
	Part52.Rotation = Vector3.new(-180, -55, -180)
	Part52.Anchored = true
	Part52.CanCollide = false
	Part52.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part52.CFrame = CFrame.new(20.4440498, 0.458999991, -26.7144947, -0.57357645, 0, -0.819151998, 0, 1, 0, 0.819151998, 0, -0.57357645)
	Part52.BottomSurface = Enum.SurfaceType.Smooth
	Part52.TopSurface = Enum.SurfaceType.Smooth
	Part52.Position = Vector3.new(20.4440498, 0.458999991, -26.7144947)
	Part52.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part53.Parent = Model2
	Part53.Rotation = Vector3.new(-90, 0, -30.9599991)
	Part53.Anchored = true
	Part53.CanCollide = false
	Part53.Size = Vector3.new(0.365828931, 0.108000003, 0.108000003)
	Part53.CFrame = CFrame.new(19.3108101, 0.458999991, -28.5570183, 0.857492983, 0.514495611, 0, 0, 0, 1, 0.514495611, -0.857492983, 0)
	Part53.BottomSurface = Enum.SurfaceType.Smooth
	Part53.TopSurface = Enum.SurfaceType.Smooth
	Part53.Position = Vector3.new(19.3108101, 0.458999991, -28.5570183)
	Part53.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part54.Parent = Model2
	Part54.Rotation = Vector3.new(90, 0, -30.9599991)
	Part54.Anchored = true
	Part54.CanCollide = false
	Part54.Size = Vector3.new(0.365828931, 0.108000003, 0.108000003)
	Part54.CFrame = CFrame.new(19.3108101, 0.458999991, -28.7441921, 0.857492983, 0.514495611, 0, 0, 0, -1, -0.514495611, 0.857492983, 0)
	Part54.BottomSurface = Enum.SurfaceType.Smooth
	Part54.TopSurface = Enum.SurfaceType.Smooth
	Part54.Position = Vector3.new(19.3108101, 0.458999991, -28.7441921)
	Part54.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part55.Parent = Model2
	Part55.Rotation = Vector3.new(-180, -25, -180)
	Part55.Anchored = true
	Part55.CanCollide = false
	Part55.Size = Vector3.new(0.0764999986, 0.108000003, 0.0719999745)
	Part55.CFrame = CFrame.new(19.7329655, 0.458999991, -26.0193291, -0.906307817, 0, -0.42261821, 0, 1, 0, 0.42261821, 0, -0.906307817)
	Part55.BottomSurface = Enum.SurfaceType.Smooth
	Part55.TopSurface = Enum.SurfaceType.Smooth
	Part55.Position = Vector3.new(19.7329655, 0.458999991, -26.0193291)
	Part55.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part56.Parent = Model2
	Part56.Rotation = Vector3.new(-180, -45, -180)
	Part56.Anchored = true
	Part56.CanCollide = false
	Part56.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part56.CFrame = CFrame.new(20.5735645, 0.458999991, -26.310915, -0.70710665, 0, -0.707106888, 0, 1, 0, 0.707106888, 0, -0.70710665)
	Part56.BottomSurface = Enum.SurfaceType.Smooth
	Part56.TopSurface = Enum.SurfaceType.Smooth
	Part56.Position = Vector3.new(20.5735645, 0.458999991, -26.310915)
	Part56.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part57.Parent = Model2
	Part57.Rotation = Vector3.new(0, -30, 0)
	Part57.Anchored = true
	Part57.CanCollide = false
	Part57.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part57.CFrame = CFrame.new(20.2678757, 0.458999991, -28.6328602, 0.866025388, 0, -0.5, 0, 1, 0, 0.5, 0, 0.866025388)
	Part57.BottomSurface = Enum.SurfaceType.Smooth
	Part57.TopSurface = Enum.SurfaceType.Smooth
	Part57.Position = Vector3.new(20.2678757, 0.458999991, -28.6328602)
	Part57.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part58.Parent = Model2
	Part58.Rotation = Vector3.new(0, -65, 0)
	Part58.Anchored = true
	Part58.CanCollide = false
	Part58.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part58.CFrame = CFrame.new(20.8675861, 0.458999991, -27.9783897, 0.422618061, 0, -0.906307817, 0, 1, 0, 0.906307817, 0, 0.422618061)
	Part58.BottomSurface = Enum.SurfaceType.Smooth
	Part58.TopSurface = Enum.SurfaceType.Smooth
	Part58.Position = Vector3.new(20.8675861, 0.458999991, -27.9783897)
	Part58.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part59.Parent = Model2
	Part59.Rotation = Vector3.new(0, -45, 0)
	Part59.Anchored = true
	Part59.CanCollide = false
	Part59.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part59.CFrame = CFrame.new(20.5735645, 0.458999991, -28.3982964, 0.707106769, 0, -0.707106769, 0, 1, 0, 0.707106769, 0, 0.707106769)
	Part59.BottomSurface = Enum.SurfaceType.Smooth
	Part59.TopSurface = Enum.SurfaceType.Smooth
	Part59.Position = Vector3.new(20.5735645, 0.458999991, -28.3982964)
	Part59.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part60.Parent = Model2
	Part60.Rotation = Vector3.new(-180, -60, -180)
	Part60.Anchored = true
	Part60.CanCollide = false
	Part60.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part60.CFrame = CFrame.new(20.4963608, 0.458999991, -26.796608, -0.500000179, 0, -0.866025329, 0, 1, 0, 0.866025329, 0, -0.500000179)
	Part60.BottomSurface = Enum.SurfaceType.Smooth
	Part60.TopSurface = Enum.SurfaceType.Smooth
	Part60.Position = Vector3.new(20.4963608, 0.458999991, -26.796608)
	Part60.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part61.Parent = Model2
	Part61.Rotation = Vector3.new(-180, -25, -180)
	Part61.Anchored = true
	Part61.CanCollide = false
	Part61.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part61.CFrame = CFrame.new(20.1536617, 0.458999991, -26.0168953, -0.906307817, 0, -0.42261821, 0, 1, 0, 0.42261821, 0, -0.906307817)
	Part61.BottomSurface = Enum.SurfaceType.Smooth
	Part61.TopSurface = Enum.SurfaceType.Smooth
	Part61.Position = Vector3.new(20.1536617, 0.458999991, -26.0168953)
	Part61.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part62.Parent = Model2
	Part62.Rotation = Vector3.new(0, -50, 0)
	Part62.Anchored = true
	Part62.CanCollide = false
	Part62.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part62.CFrame = CFrame.new(20.3847828, 0.458999991, -28.0719585, 0.642787576, 0, -0.766044378, 0, 1, 0, 0.766044378, 0, 0.642787576)
	Part62.BottomSurface = Enum.SurfaceType.Smooth
	Part62.TopSurface = Enum.SurfaceType.Smooth
	Part62.Position = Vector3.new(20.3847828, 0.458999991, -28.0719585)
	Part62.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part63.Parent = Model2
	Part63.Rotation = Vector3.new(-180, -45, -180)
	Part63.Anchored = true
	Part63.CanCollide = false
	Part63.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part63.CFrame = CFrame.new(20.3190079, 0.458999991, -26.5654755, -0.70710665, 0, -0.707106888, 0, 1, 0, 0.707106888, 0, -0.70710665)
	Part63.BottomSurface = Enum.SurfaceType.Smooth
	Part63.TopSurface = Enum.SurfaceType.Smooth
	Part63.Position = Vector3.new(20.3190079, 0.458999991, -26.5654755)
	Part63.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part64.Parent = Model2
	Part64.Rotation = Vector3.new(-180, -55, -180)
	Part64.Anchored = true
	Part64.CanCollide = false
	Part64.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part64.CFrame = CFrame.new(20.7389431, 0.458999991, -26.508007, -0.57357645, 0, -0.819151998, 0, 1, 0, 0.819151998, 0, -0.57357645)
	Part64.BottomSurface = Enum.SurfaceType.Smooth
	Part64.TopSurface = Enum.SurfaceType.Smooth
	Part64.Position = Vector3.new(20.7389431, 0.458999991, -26.508007)
	Part64.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part65.Parent = Model2
	Part65.Rotation = Vector3.new(0, -30, 0)
	Part65.Anchored = true
	Part65.CanCollide = false
	Part65.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part65.CFrame = CFrame.new(20.0878754, 0.458999991, -28.3210907, 0.866025388, 0, -0.5, 0, 1, 0, 0.5, 0, 0.866025388)
	Part65.BottomSurface = Enum.SurfaceType.Smooth
	Part65.TopSurface = Enum.SurfaceType.Smooth
	Part65.Position = Vector3.new(20.0878754, 0.458999991, -28.3210907)
	Part65.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part66.Parent = Model2
	Part66.Rotation = Vector3.new(-180, -40, -180)
	Part66.Anchored = true
	Part66.CanCollide = false
	Part66.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part66.CFrame = CFrame.new(20.4786301, 0.458999991, -26.2239246, -0.766044736, 0, -0.642787218, 0, 1, 0, 0.642787218, 0, -0.766044736)
	Part66.BottomSurface = Enum.SurfaceType.Smooth
	Part66.TopSurface = Enum.SurfaceType.Smooth
	Part66.Position = Vector3.new(20.4786301, 0.458999991, -26.2239246)
	Part66.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part67.Parent = Model2
	Part67.Rotation = Vector3.new(0, -85, 0)
	Part67.Anchored = true
	Part67.CanCollide = false
	Part67.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part67.CFrame = CFrame.new(21.0002594, 0.458999991, -27.4832497, 0.0871559083, 0, -0.996194661, 0, 1, 0, 0.996194661, 0, 0.0871559083)
	Part67.BottomSurface = Enum.SurfaceType.Smooth
	Part67.TopSurface = Enum.SurfaceType.Smooth
	Part67.Position = Vector3.new(21.0002594, 0.458999991, -27.4832497)
	Part67.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part68.Parent = Model2
	Part68.Rotation = Vector3.new(0, -25, 0)
	Part68.Anchored = true
	Part68.CanCollide = false
	Part68.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part68.CFrame = CFrame.new(20.1536617, 0.458999991, -28.6923161, 0.906307757, 0, -0.42261827, 0, 1, 0, 0.42261827, 0, 0.906307757)
	Part68.BottomSurface = Enum.SurfaceType.Smooth
	Part68.TopSurface = Enum.SurfaceType.Smooth
	Part68.Position = Vector3.new(20.1536617, 0.458999991, -28.6923161)
	Part68.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part69.Parent = Model2
	Part69.Rotation = Vector3.new(-180, -70, -180)
	Part69.Anchored = true
	Part69.CanCollide = false
	Part69.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part69.CFrame = CFrame.new(20.9168625, 0.458999991, -26.8497849, -0.342020154, 0, -0.939692557, 0, 1, 0, 0.939692557, 0, -0.342020154)
	Part69.BottomSurface = Enum.SurfaceType.Smooth
	Part69.TopSurface = Enum.SurfaceType.Smooth
	Part69.Position = Vector3.new(20.9168625, 0.458999991, -26.8497849)
	Part69.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part70.Parent = Model2
	Part70.Rotation = Vector3.new(-180, -75, -180)
	Part70.Anchored = true
	Part70.CanCollide = false
	Part70.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part70.CFrame = CFrame.new(20.9555817, 0.458999991, -26.9725876, -0.258819103, 0, -0.965925813, 0, 1, 0, 0.965925813, 0, -0.258819103)
	Part70.BottomSurface = Enum.SurfaceType.Smooth
	Part70.TopSurface = Enum.SurfaceType.Smooth
	Part70.Position = Vector3.new(20.9555817, 0.458999991, -26.9725876)
	Part70.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part71.Parent = Model2
	Part71.Rotation = Vector3.new(0, -89.9799957, 0)
	Part71.Anchored = true
	Part71.CanCollide = false
	Part71.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part71.CFrame = CFrame.new(21.0058746, 0.458999991, -27.3546066, 1.78813934E-7, 0, -0.99999994, 0, 1, 0, 0.99999994, 0, 1.78813934E-7)
	Part71.BottomSurface = Enum.SurfaceType.Smooth
	Part71.TopSurface = Enum.SurfaceType.Smooth
	Part71.Position = Vector3.new(21.0058746, 0.458999991, -27.3546066)
	Part71.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part72.Parent = Model2
	Part72.Rotation = Vector3.new(0, -10, 0)
	Part72.Anchored = true
	Part72.CanCollide = false
	Part72.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part72.CFrame = CFrame.new(19.7236671, 0.458999991, -28.4536514, 0.984807789, 0, -0.17364797, 0, 1, 0, 0.17364797, 0, 0.984807789)
	Part72.BottomSurface = Enum.SurfaceType.Smooth
	Part72.TopSurface = Enum.SurfaceType.Smooth
	Part72.Position = Vector3.new(19.7236671, 0.458999991, -28.4536514)
	Part72.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part73.Parent = Model2
	Part73.Rotation = Vector3.new(-180, -85, -180)
	Part73.Anchored = true
	Part73.CanCollide = false
	Part73.Size = Vector3.new(0.179999992, 0.108000003, 0.108000003)
	Part73.CFrame = CFrame.new(20.6416283, 0.458999991, -27.2573414, -0.0871553719, 0, -0.99619472, 0, 1, 0, 0.99619472, 0, -0.0871553719)
	Part73.BottomSurface = Enum.SurfaceType.Smooth
	Part73.TopSurface = Enum.SurfaceType.Smooth
	Part73.Position = Vector3.new(20.6416283, 0.458999991, -27.2573414)
	Part73.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Model74.Name = "b"
	Model74.Parent = Model1
	Part75.Parent = Model74
	Part75.Material = Enum.Material.Neon
	Part75.Rotation = Vector3.new(90, 0, -55.9599991)
	Part75.Anchored = true
	Part75.CanCollide = false
	Part75.Size = Vector3.new(0.176828817, 0.274500012, 0.0500000007)
	Part75.CFrame = CFrame.new(19.9220924, 0.458999991, -26.1056194, 0.559716702, 0.828684032, 0, 0, 0, -1, -0.828684032, 0.559716702, 0)
	Part75.BottomSurface = Enum.SurfaceType.Smooth
	Part75.TopSurface = Enum.SurfaceType.Smooth
	Part75.Position = Vector3.new(19.9220924, 0.458999991, -26.1056194)
	Part75.Color = Color3.new(1, 0, 0)
	BlockMesh76.Parent = Part75
	BlockMesh76.Scale = Vector3.new(1, 1, 0.900000095)
	BlockMesh76.Scale = Vector3.new(1, 1, 0.900000095)
	Part77.Parent = Model74
	Part77.Material = Enum.Material.Neon
	Part77.Rotation = Vector3.new(-180, -65, -180)
	Part77.Anchored = true
	Part77.CanCollide = false
	Part77.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part77.CFrame = CFrame.new(20.7656269, 0.458999991, -26.7783661, -0.422618151, 0, -0.906307876, 0, 1, 0, 0.906307876, 0, -0.422618151)
	Part77.BottomSurface = Enum.SurfaceType.Smooth
	Part77.TopSurface = Enum.SurfaceType.Smooth
	Part77.Position = Vector3.new(20.7656269, 0.458999991, -26.7783661)
	Part77.Color = Color3.new(1, 0, 0)
	BlockMesh78.Parent = Part77
	BlockMesh78.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh78.Scale = Vector3.new(1, 0.900000095, 1)
	Part79.Parent = Model74
	Part79.Material = Enum.Material.Neon
	Part79.Rotation = Vector3.new(0, -85, 0)
	Part79.Anchored = true
	Part79.CanCollide = false
	Part79.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part79.CFrame = CFrame.new(20.8881874, 0.458999991, -27.473444, 0.0871559083, 0, -0.996194661, 0, 1, 0, 0.996194661, 0, 0.0871559083)
	Part79.BottomSurface = Enum.SurfaceType.Smooth
	Part79.TopSurface = Enum.SurfaceType.Smooth
	Part79.Position = Vector3.new(20.8881874, 0.458999991, -27.473444)
	Part79.Color = Color3.new(1, 0, 0)
	BlockMesh80.Parent = Part79
	BlockMesh80.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh80.Scale = Vector3.new(1, 0.900000095, 1)
	Part81.Parent = Model74
	Part81.Material = Enum.Material.Neon
	Part81.Rotation = Vector3.new(0, -35, 0)
	Part81.Anchored = true
	Part81.CanCollide = false
	Part81.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part81.CFrame = CFrame.new(20.3119469, 0.458999991, -28.4715195, 0.819152176, 0, -0.573576331, 0, 1, 0, 0.573576331, 0, 0.819152176)
	Part81.BottomSurface = Enum.SurfaceType.Smooth
	Part81.TopSurface = Enum.SurfaceType.Smooth
	Part81.Position = Vector3.new(20.3119469, 0.458999991, -28.4715195)
	Part81.Color = Color3.new(1, 0, 0)
	BlockMesh82.Parent = Part81
	BlockMesh82.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh82.Scale = Vector3.new(1, 0.900000095, 1)
	Part83.Parent = Model74
	Part83.Material = Enum.Material.Neon
	Part83.Rotation = Vector3.new(-180, -25, -180)
	Part83.Anchored = true
	Part83.CanCollide = false
	Part83.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part83.CFrame = CFrame.new(20.1061153, 0.458999991, -26.1188545, -0.906307817, 0, -0.42261821, 0, 1, 0, 0.42261821, 0, -0.906307817)
	Part83.BottomSurface = Enum.SurfaceType.Smooth
	Part83.TopSurface = Enum.SurfaceType.Smooth
	Part83.Position = Vector3.new(20.1061153, 0.458999991, -26.1188545)
	Part83.Color = Color3.new(1, 0, 0)
	BlockMesh84.Parent = Part83
	BlockMesh84.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh84.Scale = Vector3.new(1, 0.900000095, 1)
	Part85.Parent = Model74
	Part85.Material = Enum.Material.Neon
	Part85.Rotation = Vector3.new(0, -5, 0)
	Part85.Anchored = true
	Part85.CanCollide = false
	Part85.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part85.CFrame = CFrame.new(19.6487122, 0.458999991, -28.7129173, 0.99619472, 0, -0.0871555507, 0, 1, 0, 0.0871555507, 0, 0.99619472)
	Part85.BottomSurface = Enum.SurfaceType.Smooth
	Part85.TopSurface = Enum.SurfaceType.Smooth
	Part85.Position = Vector3.new(19.6487122, 0.458999991, -28.7129173)
	Part85.Color = Color3.new(1, 0, 0)
	BlockMesh86.Parent = Part85
	BlockMesh86.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh86.Scale = Vector3.new(1, 0.900000095, 1)
	Part87.Parent = Model74
	Part87.Material = Enum.Material.Neon
	Part87.Rotation = Vector3.new(0, -60, 0)
	Part87.Anchored = true
	Part87.CanCollide = false
	Part87.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part87.CFrame = CFrame.new(20.7107029, 0.458999991, -28.036356, 0.499999642, 0, -0.866025627, 0, 1, 0, 0.866025627, 0, 0.499999642)
	Part87.BottomSurface = Enum.SurfaceType.Smooth
	Part87.TopSurface = Enum.SurfaceType.Smooth
	Part87.Position = Vector3.new(20.7107029, 0.458999991, -28.036356)
	Part87.Color = Color3.new(1, 0, 0)
	BlockMesh88.Parent = Part87
	BlockMesh88.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh88.Scale = Vector3.new(1, 0.900000095, 1)
	Part89.Parent = Model74
	Part89.Material = Enum.Material.Neon
	Part89.Rotation = Vector3.new(-90, 0, -30.9599991)
	Part89.Anchored = true
	Part89.CanCollide = false
	Part89.Size = Vector3.new(0.181328908, 0.274500012, 0.0500000007)
	Part89.CFrame = CFrame.new(19.3555717, 0.458999991, -28.6534863, 0.857492983, 0.514495611, 0, 0, 0, 1, 0.514495611, -0.857492983, 0)
	Part89.BottomSurface = Enum.SurfaceType.Smooth
	Part89.TopSurface = Enum.SurfaceType.Smooth
	Part89.Position = Vector3.new(19.3555717, 0.458999991, -28.6534863)
	Part89.Color = Color3.new(1, 0, 0)
	BlockMesh90.Parent = Part89
	BlockMesh90.Scale = Vector3.new(1, 1, 0.900000095)
	BlockMesh90.Scale = Vector3.new(1, 1, 0.900000095)
	Part91.Parent = Model74
	Part91.Material = Enum.Material.Neon
	Part91.Rotation = Vector3.new(-180, -35, -180)
	Part91.Anchored = true
	Part91.CanCollide = false
	Part91.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part91.CFrame = CFrame.new(20.3119469, 0.458999991, -26.2376919, -0.819152117, 0, -0.573576212, 0, 1, 0, 0.573576212, 0, -0.819152117)
	Part91.BottomSurface = Enum.SurfaceType.Smooth
	Part91.TopSurface = Enum.SurfaceType.Smooth
	Part91.Position = Vector3.new(20.3119469, 0.458999991, -26.2376919)
	Part91.Color = Color3.new(1, 0, 0)
	BlockMesh92.Parent = Part91
	BlockMesh92.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh92.Scale = Vector3.new(1, 0.900000095, 1)
	Part93.Parent = Model74
	Part93.Material = Enum.Material.Neon
	Part93.Rotation = Vector3.new(-180, -80, -180)
	Part93.Anchored = true
	Part93.CanCollide = false
	Part93.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part93.CFrame = CFrame.new(20.8726616, 0.458999991, -27.117836, -0.173648432, 0, -0.98480767, 0, 1, 0, 0.98480767, 0, -0.173648432)
	Part93.BottomSurface = Enum.SurfaceType.Smooth
	Part93.TopSurface = Enum.SurfaceType.Smooth
	Part93.Position = Vector3.new(20.8726616, 0.458999991, -27.117836)
	Part93.Color = Color3.new(1, 0, 0)
	BlockMesh94.Parent = Part93
	BlockMesh94.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh94.Scale = Vector3.new(1, 0.900000095, 1)
	Part95.Parent = Model74
	Part95.Material = Enum.Material.Neon
	Part95.Rotation = Vector3.new(-180, -30, -180)
	Part95.Anchored = true
	Part95.CanCollide = false
	Part95.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part95.CFrame = CFrame.new(20.2116261, 0.458999991, -26.1737804, -0.866025388, 0, -0.499999762, 0, 1, 0, 0.499999762, 0, -0.866025388)
	Part95.BottomSurface = Enum.SurfaceType.Smooth
	Part95.TopSurface = Enum.SurfaceType.Smooth
	Part95.Position = Vector3.new(20.2116261, 0.458999991, -26.1737804)
	Part95.Color = Color3.new(1, 0, 0)
	BlockMesh96.Parent = Part95
	BlockMesh96.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh96.Scale = Vector3.new(1, 0.900000095, 1)
	Part97.Parent = Model74
	Part97.Material = Enum.Material.Neon
	Part97.Rotation = Vector3.new(0, -89.9799957, 0)
	Part97.Anchored = true
	Part97.CanCollide = false
	Part97.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part97.CFrame = CFrame.new(20.8933754, 0.458999991, -27.3546066, 1.78813934E-7, 0, -0.99999994, 0, 1, 0, 0.99999994, 0, 1.78813934E-7)
	Part97.BottomSurface = Enum.SurfaceType.Smooth
	Part97.TopSurface = Enum.SurfaceType.Smooth
	Part97.Position = Vector3.new(20.8933754, 0.458999991, -27.3546066)
	Part97.Color = Color3.new(1, 0, 0)
	BlockMesh98.Parent = Part97
	BlockMesh98.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh98.Scale = Vector3.new(1, 0.900000095, 1)
	Part99.Parent = Model74
	Part99.Material = Enum.Material.Neon
	Part99.Anchored = true
	Part99.CanCollide = false
	Part99.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part99.CFrame = CFrame.new(19.5298767, 0.458999991, -28.7181053, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part99.BottomSurface = Enum.SurfaceType.Smooth
	Part99.TopSurface = Enum.SurfaceType.Smooth
	Part99.Position = Vector3.new(19.5298767, 0.458999991, -28.7181053)
	Part99.Color = Color3.new(1, 0, 0)
	BlockMesh100.Parent = Part99
	BlockMesh100.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh100.Scale = Vector3.new(1, 0.900000095, 1)
	Part101.Parent = Model74
	Part101.Material = Enum.Material.Neon
	Part101.Rotation = Vector3.new(0, -30, 0)
	Part101.Anchored = true
	Part101.CanCollide = false
	Part101.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part101.CFrame = CFrame.new(20.2116261, 0.458999991, -28.5354309, 0.866025388, 0, -0.5, 0, 1, 0, 0.5, 0, 0.866025388)
	Part101.BottomSurface = Enum.SurfaceType.Smooth
	Part101.TopSurface = Enum.SurfaceType.Smooth
	Part101.Position = Vector3.new(20.2116261, 0.458999991, -28.5354309)
	Part101.Color = Color3.new(1, 0, 0)
	BlockMesh102.Parent = Part101
	BlockMesh102.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh102.Scale = Vector3.new(1, 0.900000095, 1)
	Part103.Parent = Model74
	Part103.Material = Enum.Material.Neon
	Part103.Rotation = Vector3.new(0, -80, 0)
	Part103.Anchored = true
	Part103.CanCollide = false
	Part103.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part103.CFrame = CFrame.new(20.8726616, 0.458999991, -27.5913754, 0.173648149, 0, -0.98480773, 0, 1, 0, 0.98480773, 0, 0.173648149)
	Part103.BottomSurface = Enum.SurfaceType.Smooth
	Part103.TopSurface = Enum.SurfaceType.Smooth
	Part103.Position = Vector3.new(20.8726616, 0.458999991, -27.5913754)
	Part103.Color = Color3.new(1, 0, 0)
	BlockMesh104.Parent = Part103
	BlockMesh104.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh104.Scale = Vector3.new(1, 0.900000095, 1)
	Part105.Parent = Model74
	Part105.Material = Enum.Material.Neon
	Part105.Rotation = Vector3.new(-180, -50, -180)
	Part105.Anchored = true
	Part105.CanCollide = false
	Part105.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part105.CFrame = CFrame.new(20.5743771, 0.458999991, -26.4781647, -0.642787576, 0, -0.766044378, 0, 1, 0, 0.766044378, 0, -0.642787576)
	Part105.BottomSurface = Enum.SurfaceType.Smooth
	Part105.TopSurface = Enum.SurfaceType.Smooth
	Part105.Position = Vector3.new(20.5743771, 0.458999991, -26.4781647)
	Part105.Color = Color3.new(1, 0, 0)
	BlockMesh106.Parent = Part105
	BlockMesh106.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh106.Scale = Vector3.new(1, 0.900000095, 1)
	Part107.Parent = Model74
	Part107.Material = Enum.Material.Neon
	Part107.Rotation = Vector3.new(-180, -85, -180)
	Part107.Anchored = true
	Part107.CanCollide = false
	Part107.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part107.CFrame = CFrame.new(20.8881874, 0.458999991, -27.2357693, -0.0871553719, 0, -0.99619472, 0, 1, 0, 0.99619472, 0, -0.0871553719)
	Part107.BottomSurface = Enum.SurfaceType.Smooth
	Part107.TopSurface = Enum.SurfaceType.Smooth
	Part107.Position = Vector3.new(20.8881874, 0.458999991, -27.2357693)
	Part107.Color = Color3.new(1, 0, 0)
	BlockMesh108.Parent = Part107
	BlockMesh108.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh108.Scale = Vector3.new(1, 0.900000095, 1)
	Part109.Parent = Model74
	Part109.Material = Enum.Material.Neon
	Part109.Rotation = Vector3.new(0, -50, 0)
	Part109.Anchored = true
	Part109.CanCollide = false
	Part109.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part109.CFrame = CFrame.new(20.5743771, 0.458999991, -28.2310467, 0.642787576, 0, -0.766044378, 0, 1, 0, 0.766044378, 0, 0.642787576)
	Part109.BottomSurface = Enum.SurfaceType.Smooth
	Part109.TopSurface = Enum.SurfaceType.Smooth
	Part109.Position = Vector3.new(20.5743771, 0.458999991, -28.2310467)
	Part109.Color = Color3.new(1, 0, 0)
	BlockMesh110.Parent = Part109
	BlockMesh110.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh110.Scale = Vector3.new(1, 0.900000095, 1)
	Part111.Parent = Model74
	Part111.Material = Enum.Material.Neon
	Part111.Rotation = Vector3.new(0, -70, 0)
	Part111.Anchored = true
	Part111.CanCollide = false
	Part111.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part111.CFrame = CFrame.new(20.8111458, 0.458999991, -27.8209496, 0.342019945, 0, -0.939692616, 0, 1, 0, 0.939692616, 0, 0.342019945)
	Part111.BottomSurface = Enum.SurfaceType.Smooth
	Part111.TopSurface = Enum.SurfaceType.Smooth
	Part111.Position = Vector3.new(20.8111458, 0.458999991, -27.8209496)
	Part111.Color = Color3.new(1, 0, 0)
	BlockMesh112.Parent = Part111
	BlockMesh112.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh112.Scale = Vector3.new(1, 0.900000095, 1)
	Part113.Parent = Model74
	Part113.Material = Enum.Material.Neon
	Part113.Rotation = Vector3.new(-180, -70, -180)
	Part113.Anchored = true
	Part113.CanCollide = false
	Part113.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part113.CFrame = CFrame.new(20.8111458, 0.458999991, -26.8882618, -0.342020154, 0, -0.939692557, 0, 1, 0, 0.939692557, 0, -0.342020154)
	Part113.BottomSurface = Enum.SurfaceType.Smooth
	Part113.TopSurface = Enum.SurfaceType.Smooth
	Part113.Position = Vector3.new(20.8111458, 0.458999991, -26.8882618)
	Part113.Color = Color3.new(1, 0, 0)
	BlockMesh114.Parent = Part113
	BlockMesh114.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh114.Scale = Vector3.new(1, 0.900000095, 1)
	Part115.Parent = Model74
	Part115.Material = Enum.Material.Neon
	Part115.Rotation = Vector3.new(-180, -75, -180)
	Part115.Anchored = true
	Part115.CanCollide = false
	Part115.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part115.CFrame = CFrame.new(20.8469162, 0.458999991, -27.0017052, -0.258819103, 0, -0.965925813, 0, 1, 0, 0.965925813, 0, -0.258819103)
	Part115.BottomSurface = Enum.SurfaceType.Smooth
	Part115.TopSurface = Enum.SurfaceType.Smooth
	Part115.Position = Vector3.new(20.8469162, 0.458999991, -27.0017052)
	Part115.Color = Color3.new(1, 0, 0)
	BlockMesh116.Parent = Part115
	BlockMesh116.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh116.Scale = Vector3.new(1, 0.900000095, 1)
	Part117.Parent = Model74
	Part117.Material = Enum.Material.Neon
	Part117.Rotation = Vector3.new(0, -75, 0)
	Part117.Anchored = true
	Part117.CanCollide = false
	Part117.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part117.CFrame = CFrame.new(20.8469162, 0.458999991, -27.7075081, 0.258819014, 0, -0.965925872, 0, 1, 0, 0.965925872, 0, 0.258819014)
	Part117.BottomSurface = Enum.SurfaceType.Smooth
	Part117.TopSurface = Enum.SurfaceType.Smooth
	Part117.Position = Vector3.new(20.8469162, 0.458999991, -27.7075081)
	Part117.Color = Color3.new(1, 0, 0)
	BlockMesh118.Parent = Part117
	BlockMesh118.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh118.Scale = Vector3.new(1, 0.900000095, 1)
	Part119.Parent = Model74
	Part119.Material = Enum.Material.Neon
	Part119.Rotation = Vector3.new(0, -45, 0)
	Part119.Anchored = true
	Part119.CanCollide = false
	Part119.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part119.CFrame = CFrame.new(20.4940147, 0.458999991, -28.3187447, 0.707106769, 0, -0.707106769, 0, 1, 0, 0.707106769, 0, 0.707106769)
	Part119.BottomSurface = Enum.SurfaceType.Smooth
	Part119.TopSurface = Enum.SurfaceType.Smooth
	Part119.Position = Vector3.new(20.4940147, 0.458999991, -28.3187447)
	Part119.Color = Color3.new(1, 0, 0)
	BlockMesh120.Parent = Part119
	BlockMesh120.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh120.Scale = Vector3.new(1, 0.900000095, 1)
	Part121.Parent = Model74
	Part121.Material = Enum.Material.Neon
	Part121.Rotation = Vector3.new(0, -55, 0)
	Part121.Anchored = true
	Part121.CanCollide = false
	Part121.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part121.CFrame = CFrame.new(20.6467896, 0.458999991, -28.1366768, 0.573576629, 0, -0.819151938, 0, 1, 0, 0.819151938, 0, 0.573576629)
	Part121.BottomSurface = Enum.SurfaceType.Smooth
	Part121.TopSurface = Enum.SurfaceType.Smooth
	Part121.Position = Vector3.new(20.6467896, 0.458999991, -28.1366768)
	Part121.Color = Color3.new(1, 0, 0)
	BlockMesh122.Parent = Part121
	BlockMesh122.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh122.Scale = Vector3.new(1, 0.900000095, 1)
	Part123.Parent = Model74
	Part123.Material = Enum.Material.Neon
	Part123.Rotation = Vector3.new(0, -15, 0)
	Part123.Anchored = true
	Part123.CanCollide = false
	Part123.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part123.CFrame = CFrame.new(19.8827763, 0.458999991, -28.6716461, 0.965925932, 0, -0.258818656, 0, 1, 0, 0.258818656, 0, 0.965925932)
	Part123.BottomSurface = Enum.SurfaceType.Smooth
	Part123.TopSurface = Enum.SurfaceType.Smooth
	Part123.Position = Vector3.new(19.8827763, 0.458999991, -28.6716461)
	Part123.Color = Color3.new(1, 0, 0)
	BlockMesh124.Parent = Part123
	BlockMesh124.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh124.Scale = Vector3.new(1, 0.900000095, 1)
	Part125.Parent = Model74
	Part125.Material = Enum.Material.Neon
	Part125.Rotation = Vector3.new(0, -10, 0)
	Part125.Anchored = true
	Part125.CanCollide = false
	Part125.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part125.CFrame = CFrame.new(19.7666454, 0.458999991, -28.6973915, 0.984807789, 0, -0.17364797, 0, 1, 0, 0.17364797, 0, 0.984807789)
	Part125.BottomSurface = Enum.SurfaceType.Smooth
	Part125.TopSurface = Enum.SurfaceType.Smooth
	Part125.Position = Vector3.new(19.7666454, 0.458999991, -28.6973915)
	Part125.Color = Color3.new(1, 0, 0)
	BlockMesh126.Parent = Part125
	BlockMesh126.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh126.Scale = Vector3.new(1, 0.900000095, 1)
	Part127.Parent = Model74
	Part127.Material = Enum.Material.Neon
	Part127.Rotation = Vector3.new(0, -20, 0)
	Part127.Anchored = true
	Part127.CanCollide = false
	Part127.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part127.CFrame = CFrame.new(19.9962196, 0.458999991, -28.6358776, 0.939692557, 0, -0.342020363, 0, 1, 0, 0.342020363, 0, 0.939692557)
	Part127.BottomSurface = Enum.SurfaceType.Smooth
	Part127.TopSurface = Enum.SurfaceType.Smooth
	Part127.Position = Vector3.new(19.9962196, 0.458999991, -28.6358776)
	Part127.Color = Color3.new(1, 0, 0)
	BlockMesh128.Parent = Part127
	BlockMesh128.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh128.Scale = Vector3.new(1, 0.900000095, 1)
	Part129.Parent = Model74
	Part129.Material = Enum.Material.Neon
	Part129.Rotation = Vector3.new(0, -40, 0)
	Part129.Anchored = true
	Part129.CanCollide = false
	Part129.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part129.CFrame = CFrame.new(20.4063168, 0.458999991, -28.3991089, 0.766044319, 0, -0.642787755, 0, 1, 0, 0.642787755, 0, 0.766044319)
	Part129.BottomSurface = Enum.SurfaceType.Smooth
	Part129.TopSurface = Enum.SurfaceType.Smooth
	Part129.Position = Vector3.new(20.4063168, 0.458999991, -28.3991089)
	Part129.Color = Color3.new(1, 0, 0)
	BlockMesh130.Parent = Part129
	BlockMesh130.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh130.Scale = Vector3.new(1, 0.900000095, 1)
	Part131.Parent = Model74
	Part131.Material = Enum.Material.Neon
	Part131.Rotation = Vector3.new(0, -25, 0)
	Part131.Anchored = true
	Part131.CanCollide = false
	Part131.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part131.CFrame = CFrame.new(20.1061153, 0.458999991, -28.5903568, 0.906307757, 0, -0.42261827, 0, 1, 0, 0.42261827, 0, 0.906307757)
	Part131.BottomSurface = Enum.SurfaceType.Smooth
	Part131.TopSurface = Enum.SurfaceType.Smooth
	Part131.Position = Vector3.new(20.1061153, 0.458999991, -28.5903568)
	Part131.Color = Color3.new(1, 0, 0)
	BlockMesh132.Parent = Part131
	BlockMesh132.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh132.Scale = Vector3.new(1, 0.900000095, 1)
	Part133.Parent = Model74
	Part133.Material = Enum.Material.Neon
	Part133.Rotation = Vector3.new(-180, -55, -180)
	Part133.Anchored = true
	Part133.CanCollide = false
	Part133.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part133.CFrame = CFrame.new(20.6467896, 0.458999991, -26.5725346, -0.57357645, 0, -0.819151998, 0, 1, 0, 0.819151998, 0, -0.57357645)
	Part133.BottomSurface = Enum.SurfaceType.Smooth
	Part133.TopSurface = Enum.SurfaceType.Smooth
	Part133.Position = Vector3.new(20.6467896, 0.458999991, -26.5725346)
	Part133.Color = Color3.new(1, 0, 0)
	BlockMesh134.Parent = Part133
	BlockMesh134.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh134.Scale = Vector3.new(1, 0.900000095, 1)
	Part135.Parent = Model74
	Part135.Material = Enum.Material.Neon
	Part135.Rotation = Vector3.new(0, -65, 0)
	Part135.Anchored = true
	Part135.CanCollide = false
	Part135.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part135.CFrame = CFrame.new(20.7656269, 0.458999991, -27.9308453, 0.422618061, 0, -0.906307817, 0, 1, 0, 0.906307817, 0, 0.422618061)
	Part135.BottomSurface = Enum.SurfaceType.Smooth
	Part135.TopSurface = Enum.SurfaceType.Smooth
	Part135.Position = Vector3.new(20.7656269, 0.458999991, -27.9308453)
	Part135.Color = Color3.new(1, 0, 0)
	BlockMesh136.Parent = Part135
	BlockMesh136.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh136.Scale = Vector3.new(1, 0.900000095, 1)
	Part137.Parent = Model74
	Part137.Material = Enum.Material.Neon
	Part137.Rotation = Vector3.new(-180, -45, -180)
	Part137.Anchored = true
	Part137.CanCollide = false
	Part137.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part137.CFrame = CFrame.new(20.4940147, 0.458999991, -26.3904667, -0.70710665, 0, -0.707106888, 0, 1, 0, 0.707106888, 0, -0.70710665)
	Part137.BottomSurface = Enum.SurfaceType.Smooth
	Part137.TopSurface = Enum.SurfaceType.Smooth
	Part137.Position = Vector3.new(20.4940147, 0.458999991, -26.3904667)
	Part137.Color = Color3.new(1, 0, 0)
	BlockMesh138.Parent = Part137
	BlockMesh138.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh138.Scale = Vector3.new(1, 0.900000095, 1)
	Part139.Parent = Model74
	Part139.Material = Enum.Material.Neon
	Part139.Rotation = Vector3.new(-180, -60, -180)
	Part139.Anchored = true
	Part139.CanCollide = false
	Part139.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part139.CFrame = CFrame.new(20.7107029, 0.458999991, -26.6728554, -0.500000179, 0, -0.866025329, 0, 1, 0, 0.866025329, 0, -0.500000179)
	Part139.BottomSurface = Enum.SurfaceType.Smooth
	Part139.TopSurface = Enum.SurfaceType.Smooth
	Part139.Position = Vector3.new(20.7107029, 0.458999991, -26.6728554)
	Part139.Color = Color3.new(1, 0, 0)
	BlockMesh140.Parent = Part139
	BlockMesh140.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh140.Scale = Vector3.new(1, 0.900000095, 1)
	Part141.Parent = Model74
	Part141.Material = Enum.Material.Neon
	Part141.Rotation = Vector3.new(0, -45, 0)
	Part141.Anchored = true
	Part141.CanCollide = false
	Part141.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part141.CFrame = CFrame.new(20.5735645, 0.458999991, -28.3982964, 0.707106769, 0, -0.707106769, 0, 1, 0, 0.707106769, 0, 0.707106769)
	Part141.BottomSurface = Enum.SurfaceType.Smooth
	Part141.TopSurface = Enum.SurfaceType.Smooth
	Part141.Position = Vector3.new(20.5735645, 0.458999991, -28.3982964)
	Part141.Color = Color3.new(1, 0, 0)
	BlockMesh142.Parent = Part141
	BlockMesh142.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh142.Scale = Vector3.new(1, 1, 0.720000029)
	Part143.Parent = Model74
	Part143.Material = Enum.Material.Neon
	Part143.Rotation = Vector3.new(-180, -25, -180)
	Part143.Anchored = true
	Part143.CanCollide = false
	Part143.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part143.CFrame = CFrame.new(20.0015182, 0.458999991, -26.3431644, -0.906307817, 0, -0.42261821, 0, 1, 0, 0.42261821, 0, -0.906307817)
	Part143.BottomSurface = Enum.SurfaceType.Smooth
	Part143.TopSurface = Enum.SurfaceType.Smooth
	Part143.Position = Vector3.new(20.0015182, 0.458999991, -26.3431644)
	Part143.Color = Color3.new(1, 0, 0)
	BlockMesh144.Parent = Part143
	BlockMesh144.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh144.Scale = Vector3.new(1, 1, 0.720000029)
	Part145.Parent = Model74
	Part145.Material = Enum.Material.Neon
	Part145.Rotation = Vector3.new(0, -35, 0)
	Part145.Anchored = true
	Part145.CanCollide = false
	Part145.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part145.CFrame = CFrame.new(20.1699867, 0.458999991, -28.2687798, 0.819152176, 0, -0.573576331, 0, 1, 0, 0.573576331, 0, 0.819152176)
	Part145.BottomSurface = Enum.SurfaceType.Smooth
	Part145.TopSurface = Enum.SurfaceType.Smooth
	Part145.Position = Vector3.new(20.1699867, 0.458999991, -28.2687798)
	Part145.Color = Color3.new(1, 0, 0)
	BlockMesh146.Parent = Part145
	BlockMesh146.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh146.Scale = Vector3.new(1, 1, 0.720000029)
	Part147.Parent = Model74
	Part147.Material = Enum.Material.Neon
	Part147.Rotation = Vector3.new(-180, -45, -180)
	Part147.Anchored = true
	Part147.CanCollide = false
	Part147.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part147.CFrame = CFrame.new(20.3190079, 0.458999991, -26.5654755, -0.70710665, 0, -0.707106888, 0, 1, 0, 0.707106888, 0, -0.70710665)
	Part147.BottomSurface = Enum.SurfaceType.Smooth
	Part147.TopSurface = Enum.SurfaceType.Smooth
	Part147.Position = Vector3.new(20.3190079, 0.458999991, -26.5654755)
	Part147.Color = Color3.new(1, 0, 0)
	BlockMesh148.Parent = Part147
	BlockMesh148.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh148.Scale = Vector3.new(1, 1, 0.720000029)
	Part149.Parent = Model74
	Part149.Material = Enum.Material.Neon
	Part149.Rotation = Vector3.new(0, -40, 0)
	Part149.Anchored = true
	Part149.CanCollide = false
	Part149.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part149.CFrame = CFrame.new(20.478632, 0.458999991, -28.4852867, 0.766044319, 0, -0.642787755, 0, 1, 0, 0.642787755, 0, 0.766044319)
	Part149.BottomSurface = Enum.SurfaceType.Smooth
	Part149.TopSurface = Enum.SurfaceType.Smooth
	Part149.Position = Vector3.new(20.478632, 0.458999991, -28.4852867)
	Part149.Color = Color3.new(1, 0, 0)
	BlockMesh150.Parent = Part149
	BlockMesh150.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh150.Scale = Vector3.new(1, 1, 0.720000029)
	Part151.Parent = Model74
	Part151.Material = Enum.Material.Neon
	Part151.Rotation = Vector3.new(0, -60, 0)
	Part151.Anchored = true
	Part151.CanCollide = false
	Part151.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part151.CFrame = CFrame.new(20.8081303, 0.458999991, -28.0926056, 0.499999642, 0, -0.866025627, 0, 1, 0, 0.866025627, 0, 0.499999642)
	Part151.BottomSurface = Enum.SurfaceType.Smooth
	Part151.TopSurface = Enum.SurfaceType.Smooth
	Part151.Position = Vector3.new(20.8081303, 0.458999991, -28.0926056)
	Part151.Color = Color3.new(1, 0, 0)
	BlockMesh152.Parent = Part151
	BlockMesh152.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh152.Scale = Vector3.new(1, 1, 0.720000029)
	Part153.Parent = Model74
	Part153.Material = Enum.Material.Neon
	Part153.Rotation = Vector3.new(0, -75, 0)
	Part153.Anchored = true
	Part153.CanCollide = false
	Part153.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part153.CFrame = CFrame.new(20.9555817, 0.458999991, -27.7366219, 0.258819014, 0, -0.965925872, 0, 1, 0, 0.965925872, 0, 0.258819014)
	Part153.BottomSurface = Enum.SurfaceType.Smooth
	Part153.TopSurface = Enum.SurfaceType.Smooth
	Part153.Position = Vector3.new(20.9555817, 0.458999991, -27.7366219)
	Part153.Color = Color3.new(1, 0, 0)
	BlockMesh154.Parent = Part153
	BlockMesh154.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh154.Scale = Vector3.new(1, 1, 0.720000029)
	Part155.Parent = Model74
	Part155.Material = Enum.Material.Neon
	Part155.Rotation = Vector3.new(0, -89.9799957, 0)
	Part155.Anchored = true
	Part155.CanCollide = false
	Part155.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part155.CFrame = CFrame.new(20.6458759, 0.458999991, -27.3546066, 1.78813934E-7, 0, -0.99999994, 0, 1, 0, 0.99999994, 0, 1.78813934E-7)
	Part155.BottomSurface = Enum.SurfaceType.Smooth
	Part155.TopSurface = Enum.SurfaceType.Smooth
	Part155.Position = Vector3.new(20.6458759, 0.458999991, -27.3546066)
	Part155.Color = Color3.new(1, 0, 0)
	BlockMesh156.Parent = Part155
	BlockMesh156.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh156.Scale = Vector3.new(1, 1, 0.720000029)
	Part157.Parent = Model74
	Part157.Material = Enum.Material.Neon
	Part157.Anchored = true
	Part157.CanCollide = false
	Part157.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part157.CFrame = CFrame.new(19.5298767, 0.458999991, -28.8306046, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part157.BottomSurface = Enum.SurfaceType.Smooth
	Part157.TopSurface = Enum.SurfaceType.Smooth
	Part157.Position = Vector3.new(19.5298767, 0.458999991, -28.8306046)
	Part157.Color = Color3.new(1, 0, 0)
	BlockMesh158.Parent = Part157
	BlockMesh158.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh158.Scale = Vector3.new(1, 1, 0.720000029)
	Part159.Parent = Model74
	Part159.Material = Enum.Material.Neon
	Part159.Rotation = Vector3.new(-180, -25, -180)
	Part159.Anchored = true
	Part159.CanCollide = false
	Part159.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part159.CFrame = CFrame.new(20.1536617, 0.458999991, -26.0168953, -0.906307817, 0, -0.42261821, 0, 1, 0, 0.42261821, 0, -0.906307817)
	Part159.BottomSurface = Enum.SurfaceType.Smooth
	Part159.TopSurface = Enum.SurfaceType.Smooth
	Part159.Position = Vector3.new(20.1536617, 0.458999991, -26.0168953)
	Part159.Color = Color3.new(1, 0, 0)
	BlockMesh160.Parent = Part159
	BlockMesh160.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh160.Scale = Vector3.new(1, 1, 0.720000029)
	Part161.Parent = Model74
	Part161.Material = Enum.Material.Neon
	Part161.Rotation = Vector3.new(0, -65, 0)
	Part161.Anchored = true
	Part161.CanCollide = false
	Part161.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part161.CFrame = CFrame.new(20.5413151, 0.458999991, -27.8262482, 0.422618061, 0, -0.906307817, 0, 1, 0, 0.906307817, 0, 0.422618061)
	Part161.BottomSurface = Enum.SurfaceType.Smooth
	Part161.TopSurface = Enum.SurfaceType.Smooth
	Part161.Position = Vector3.new(20.5413151, 0.458999991, -27.8262482)
	Part161.Color = Color3.new(1, 0, 0)
	BlockMesh162.Parent = Part161
	BlockMesh162.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh162.Scale = Vector3.new(1, 1, 0.720000029)
	Part163.Parent = Model74
	Part163.Material = Enum.Material.Neon
	Part163.Rotation = Vector3.new(0, -5, 0)
	Part163.Anchored = true
	Part163.CanCollide = false
	Part163.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part163.CFrame = CFrame.new(19.6585178, 0.458999991, -28.8249893, 0.99619472, 0, -0.0871555507, 0, 1, 0, 0.0871555507, 0, 0.99619472)
	Part163.BottomSurface = Enum.SurfaceType.Smooth
	Part163.TopSurface = Enum.SurfaceType.Smooth
	Part163.Position = Vector3.new(19.6585178, 0.458999991, -28.8249893)
	Part163.Color = Color3.new(1, 0, 0)
	BlockMesh164.Parent = Part163
	BlockMesh164.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh164.Scale = Vector3.new(1, 1, 0.720000029)
	Part165.Parent = Model74
	Part165.Material = Enum.Material.Neon
	Part165.Rotation = Vector3.new(-180, -55, -180)
	Part165.Anchored = true
	Part165.CanCollide = false
	Part165.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part165.CFrame = CFrame.new(20.4440498, 0.458999991, -26.7144947, -0.57357645, 0, -0.819151998, 0, 1, 0, 0.819151998, 0, -0.57357645)
	Part165.BottomSurface = Enum.SurfaceType.Smooth
	Part165.TopSurface = Enum.SurfaceType.Smooth
	Part165.Position = Vector3.new(20.4440498, 0.458999991, -26.7144947)
	Part165.Color = Color3.new(1, 0, 0)
	BlockMesh166.Parent = Part165
	BlockMesh166.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh166.Scale = Vector3.new(1, 1, 0.720000029)
	Part167.Parent = Model74
	Part167.Material = Enum.Material.Neon
	Part167.Rotation = Vector3.new(-180, -50, -180)
	Part167.Anchored = true
	Part167.CanCollide = false
	Part167.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part167.CFrame = CFrame.new(20.3847828, 0.458999991, -26.6372528, -0.642787576, 0, -0.766044378, 0, 1, 0, 0.766044378, 0, -0.642787576)
	Part167.BottomSurface = Enum.SurfaceType.Smooth
	Part167.TopSurface = Enum.SurfaceType.Smooth
	Part167.Position = Vector3.new(20.3847828, 0.458999991, -26.6372528)
	Part167.Color = Color3.new(1, 0, 0)
	BlockMesh168.Parent = Part167
	BlockMesh168.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh168.Scale = Vector3.new(1, 1, 0.720000029)
	Part169.Parent = Model74
	Part169.Material = Enum.Material.Neon
	Part169.Rotation = Vector3.new(-180, -80, -180)
	Part169.Anchored = true
	Part169.CanCollide = false
	Part169.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part169.CFrame = CFrame.new(20.9834518, 0.458999991, -27.0983009, -0.173648432, 0, -0.98480767, 0, 1, 0, 0.98480767, 0, -0.173648432)
	Part169.BottomSurface = Enum.SurfaceType.Smooth
	Part169.TopSurface = Enum.SurfaceType.Smooth
	Part169.Position = Vector3.new(20.9834518, 0.458999991, -27.0983009)
	Part169.Color = Color3.new(1, 0, 0)
	BlockMesh170.Parent = Part169
	BlockMesh170.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh170.Scale = Vector3.new(1, 1, 0.720000029)
	Part171.Parent = Model74
	Part171.Material = Enum.Material.Neon
	Part171.Rotation = Vector3.new(0, -60, 0)
	Part171.Anchored = true
	Part171.CanCollide = false
	Part171.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part171.CFrame = CFrame.new(20.4963608, 0.458999991, -27.9126072, 0.499999642, 0, -0.866025627, 0, 1, 0, 0.866025627, 0, 0.499999642)
	Part171.BottomSurface = Enum.SurfaceType.Smooth
	Part171.TopSurface = Enum.SurfaceType.Smooth
	Part171.Position = Vector3.new(20.4963608, 0.458999991, -27.9126072)
	Part171.Color = Color3.new(1, 0, 0)
	BlockMesh172.Parent = Part171
	BlockMesh172.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh172.Scale = Vector3.new(1, 1, 0.720000029)
	Part173.Parent = Model74
	Part173.Material = Enum.Material.Neon
	Part173.Rotation = Vector3.new(-180, -30, -180)
	Part173.Anchored = true
	Part173.CanCollide = false
	Part173.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part173.CFrame = CFrame.new(20.0878754, 0.458999991, -26.3881226, -0.866025388, 0, -0.499999762, 0, 1, 0, 0.499999762, 0, -0.866025388)
	Part173.BottomSurface = Enum.SurfaceType.Smooth
	Part173.TopSurface = Enum.SurfaceType.Smooth
	Part173.Position = Vector3.new(20.0878754, 0.458999991, -26.3881226)
	Part173.Color = Color3.new(1, 0, 0)
	BlockMesh174.Parent = Part173
	BlockMesh174.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh174.Scale = Vector3.new(1, 1, 0.720000029)
	Part175.Parent = Model74
	Part175.Material = Enum.Material.Neon
	Part175.Rotation = Vector3.new(0, -70, 0)
	Part175.Anchored = true
	Part175.CanCollide = false
	Part175.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part175.CFrame = CFrame.new(20.5785732, 0.458999991, -27.7362995, 0.342019945, 0, -0.939692616, 0, 1, 0, 0.939692616, 0, 0.342019945)
	Part175.BottomSurface = Enum.SurfaceType.Smooth
	Part175.TopSurface = Enum.SurfaceType.Smooth
	Part175.Position = Vector3.new(20.5785732, 0.458999991, -27.7362995)
	Part175.Color = Color3.new(1, 0, 0)
	BlockMesh176.Parent = Part175
	BlockMesh176.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh176.Scale = Vector3.new(1, 1, 0.720000029)
	Part177.Parent = Model74
	Part177.Material = Enum.Material.Neon
	Part177.Rotation = Vector3.new(0, -35, 0)
	Part177.Anchored = true
	Part177.CanCollide = false
	Part177.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part177.CFrame = CFrame.new(20.3764744, 0.458999991, -28.5636749, 0.819152176, 0, -0.573576331, 0, 1, 0, 0.573576331, 0, 0.819152176)
	Part177.BottomSurface = Enum.SurfaceType.Smooth
	Part177.TopSurface = Enum.SurfaceType.Smooth
	Part177.Position = Vector3.new(20.3764744, 0.458999991, -28.5636749)
	Part177.Color = Color3.new(1, 0, 0)
	BlockMesh178.Parent = Part177
	BlockMesh178.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh178.Scale = Vector3.new(1, 1, 0.720000029)
	Part179.Parent = Model74
	Part179.Material = Enum.Material.Neon
	Part179.Anchored = true
	Part179.CanCollide = false
	Part179.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part179.CFrame = CFrame.new(19.5298767, 0.458999991, -28.4706059, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part179.BottomSurface = Enum.SurfaceType.Smooth
	Part179.TopSurface = Enum.SurfaceType.Smooth
	Part179.Position = Vector3.new(19.5298767, 0.458999991, -28.4706059)
	Part179.Color = Color3.new(1, 0, 0)
	BlockMesh180.Parent = Part179
	BlockMesh180.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh180.Scale = Vector3.new(1, 1, 0.720000029)
	Part181.Parent = Model74
	Part181.Material = Enum.Material.Neon
	Part181.Rotation = Vector3.new(-180, -60, -180)
	Part181.Anchored = true
	Part181.CanCollide = false
	Part181.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part181.CFrame = CFrame.new(20.8081303, 0.458999991, -26.6166058, -0.500000179, 0, -0.866025329, 0, 1, 0, 0.866025329, 0, -0.500000179)
	Part181.BottomSurface = Enum.SurfaceType.Smooth
	Part181.TopSurface = Enum.SurfaceType.Smooth
	Part181.Position = Vector3.new(20.8081303, 0.458999991, -26.6166058)
	Part181.Color = Color3.new(1, 0, 0)
	BlockMesh182.Parent = Part181
	BlockMesh182.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh182.Scale = Vector3.new(1, 1, 0.720000029)
	Part183.Parent = Model74
	Part183.Material = Enum.Material.Neon
	Part183.Rotation = Vector3.new(0, -55, 0)
	Part183.Anchored = true
	Part183.CanCollide = false
	Part183.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part183.CFrame = CFrame.new(20.7389431, 0.458999991, -28.2012062, 0.573576629, 0, -0.819151938, 0, 1, 0, 0.819151938, 0, 0.573576629)
	Part183.BottomSurface = Enum.SurfaceType.Smooth
	Part183.TopSurface = Enum.SurfaceType.Smooth
	Part183.Position = Vector3.new(20.7389431, 0.458999991, -28.2012062)
	Part183.Color = Color3.new(1, 0, 0)
	BlockMesh184.Parent = Part183
	BlockMesh184.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh184.Scale = Vector3.new(1, 1, 0.720000029)
	Part185.Parent = Model74
	Part185.Material = Enum.Material.Neon
	Part185.Rotation = Vector3.new(0, -15, 0)
	Part185.Anchored = true
	Part185.CanCollide = false
	Part185.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part185.CFrame = CFrame.new(19.818718, 0.458999991, -28.432579, 0.965925932, 0, -0.258818656, 0, 1, 0, 0.258818656, 0, 0.965925932)
	Part185.BottomSurface = Enum.SurfaceType.Smooth
	Part185.TopSurface = Enum.SurfaceType.Smooth
	Part185.Position = Vector3.new(19.818718, 0.458999991, -28.432579)
	Part185.Color = Color3.new(1, 0, 0)
	BlockMesh186.Parent = Part185
	BlockMesh186.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh186.Scale = Vector3.new(1, 1, 0.720000029)
	Part187.Parent = Model74
	Part187.Material = Enum.Material.Neon
	Part187.Rotation = Vector3.new(0, -75, 0)
	Part187.Anchored = true
	Part187.CanCollide = false
	Part187.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part187.CFrame = CFrame.new(20.6078491, 0.458999991, -27.6434479, 0.258819014, 0, -0.965925872, 0, 1, 0, 0.965925872, 0, 0.258819014)
	Part187.BottomSurface = Enum.SurfaceType.Smooth
	Part187.TopSurface = Enum.SurfaceType.Smooth
	Part187.Position = Vector3.new(20.6078491, 0.458999991, -27.6434479)
	Part187.Color = Color3.new(1, 0, 0)
	BlockMesh188.Parent = Part187
	BlockMesh188.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh188.Scale = Vector3.new(1, 1, 0.720000029)
	Part189.Parent = Model74
	Part189.Material = Enum.Material.Neon
	Part189.Rotation = Vector3.new(-180, -30, -180)
	Part189.Anchored = true
	Part189.CanCollide = false
	Part189.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part189.CFrame = CFrame.new(20.2678757, 0.458999991, -26.0763512, -0.866025388, 0, -0.499999762, 0, 1, 0, 0.499999762, 0, -0.866025388)
	Part189.BottomSurface = Enum.SurfaceType.Smooth
	Part189.TopSurface = Enum.SurfaceType.Smooth
	Part189.Position = Vector3.new(20.2678757, 0.458999991, -26.0763512)
	Part189.Color = Color3.new(1, 0, 0)
	BlockMesh190.Parent = Part189
	BlockMesh190.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh190.Scale = Vector3.new(1, 1, 0.720000029)
	Part191.Parent = Model74
	Part191.Material = Enum.Material.Neon
	Part191.Rotation = Vector3.new(0, -15, 0)
	Part191.Anchored = true
	Part191.CanCollide = false
	Part191.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part191.CFrame = CFrame.new(19.9118938, 0.458999991, -28.7803116, 0.965925932, 0, -0.258818656, 0, 1, 0, 0.258818656, 0, 0.965925932)
	Part191.BottomSurface = Enum.SurfaceType.Smooth
	Part191.TopSurface = Enum.SurfaceType.Smooth
	Part191.Position = Vector3.new(19.9118938, 0.458999991, -28.7803116)
	Part191.Color = Color3.new(1, 0, 0)
	BlockMesh192.Parent = Part191
	BlockMesh192.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh192.Scale = Vector3.new(1, 1, 0.720000029)
	Part193.Parent = Model74
	Part193.Material = Enum.Material.Neon
	Part193.Rotation = Vector3.new(-180, -40, -180)
	Part193.Anchored = true
	Part193.CanCollide = false
	Part193.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part193.CFrame = CFrame.new(20.4786301, 0.458999991, -26.2239246, -0.766044736, 0, -0.642787218, 0, 1, 0, 0.642787218, 0, -0.766044736)
	Part193.BottomSurface = Enum.SurfaceType.Smooth
	Part193.TopSurface = Enum.SurfaceType.Smooth
	Part193.Position = Vector3.new(20.4786301, 0.458999991, -26.2239246)
	Part193.Color = Color3.new(1, 0, 0)
	BlockMesh194.Parent = Part193
	BlockMesh194.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh194.Scale = Vector3.new(1, 1, 0.720000029)
	Part195.Parent = Model74
	Part195.Material = Enum.Material.Neon
	Part195.Rotation = Vector3.new(0, -20, 0)
	Part195.Anchored = true
	Part195.CanCollide = false
	Part195.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part195.CFrame = CFrame.new(20.0346985, 0.458999991, -28.7415924, 0.939692557, 0, -0.342020363, 0, 1, 0, 0.342020363, 0, 0.939692557)
	Part195.BottomSurface = Enum.SurfaceType.Smooth
	Part195.TopSurface = Enum.SurfaceType.Smooth
	Part195.Position = Vector3.new(20.0346985, 0.458999991, -28.7415924)
	Part195.Color = Color3.new(1, 0, 0)
	BlockMesh196.Parent = Part195
	BlockMesh196.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh196.Scale = Vector3.new(1, 1, 0.720000029)
	Part197.Parent = Model74
	Part197.Material = Enum.Material.Neon
	Part197.Rotation = Vector3.new(0, -25, 0)
	Part197.Anchored = true
	Part197.CanCollide = false
	Part197.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part197.CFrame = CFrame.new(20.0015182, 0.458999991, -28.3660469, 0.906307757, 0, -0.42261827, 0, 1, 0, 0.42261827, 0, 0.906307757)
	Part197.BottomSurface = Enum.SurfaceType.Smooth
	Part197.TopSurface = Enum.SurfaceType.Smooth
	Part197.Position = Vector3.new(20.0015182, 0.458999991, -28.3660469)
	Part197.Color = Color3.new(1, 0, 0)
	BlockMesh198.Parent = Part197
	BlockMesh198.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh198.Scale = Vector3.new(1, 1, 0.720000029)
	Part199.Parent = Model74
	Part199.Material = Enum.Material.Neon
	Part199.Rotation = Vector3.new(-180, -75, -180)
	Part199.Anchored = true
	Part199.CanCollide = false
	Part199.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part199.CFrame = CFrame.new(20.9555817, 0.458999991, -26.9725876, -0.258819103, 0, -0.965925813, 0, 1, 0, 0.965925813, 0, -0.258819103)
	Part199.BottomSurface = Enum.SurfaceType.Smooth
	Part199.TopSurface = Enum.SurfaceType.Smooth
	Part199.Position = Vector3.new(20.9555817, 0.458999991, -26.9725876)
	Part199.Color = Color3.new(1, 0, 0)
	BlockMesh200.Parent = Part199
	BlockMesh200.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh200.Scale = Vector3.new(1, 1, 0.720000029)
	Part201.Parent = Model74
	Part201.Material = Enum.Material.Neon
	Part201.Rotation = Vector3.new(0, -89.9799957, 0)
	Part201.Anchored = true
	Part201.CanCollide = false
	Part201.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part201.CFrame = CFrame.new(21.0058746, 0.458999991, -27.3546066, 1.78813934E-7, 0, -0.99999994, 0, 1, 0, 0.99999994, 0, 1.78813934E-7)
	Part201.BottomSurface = Enum.SurfaceType.Smooth
	Part201.TopSurface = Enum.SurfaceType.Smooth
	Part201.Position = Vector3.new(21.0058746, 0.458999991, -27.3546066)
	Part201.Color = Color3.new(1, 0, 0)
	BlockMesh202.Parent = Part201
	BlockMesh202.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh202.Scale = Vector3.new(1, 1, 0.720000029)
	Part203.Parent = Model74
	Part203.Material = Enum.Material.Neon
	Part203.Rotation = Vector3.new(0, -80, 0)
	Part203.Anchored = true
	Part203.CanCollide = false
	Part203.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part203.CFrame = CFrame.new(20.9834518, 0.458999991, -27.6109104, 0.173648149, 0, -0.98480773, 0, 1, 0, 0.98480773, 0, 0.173648149)
	Part203.BottomSurface = Enum.SurfaceType.Smooth
	Part203.TopSurface = Enum.SurfaceType.Smooth
	Part203.Position = Vector3.new(20.9834518, 0.458999991, -27.6109104)
	Part203.Color = Color3.new(1, 0, 0)
	BlockMesh204.Parent = Part203
	BlockMesh204.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh204.Scale = Vector3.new(1, 1, 0.720000029)
	Part205.Parent = Model74
	Part205.Material = Enum.Material.Neon
	Part205.Rotation = Vector3.new(0, -45, 0)
	Part205.Anchored = true
	Part205.CanCollide = false
	Part205.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part205.CFrame = CFrame.new(20.3190079, 0.458999991, -28.1437378, 0.707106769, 0, -0.707106769, 0, 1, 0, 0.707106769, 0, 0.707106769)
	Part205.BottomSurface = Enum.SurfaceType.Smooth
	Part205.TopSurface = Enum.SurfaceType.Smooth
	Part205.Position = Vector3.new(20.3190079, 0.458999991, -28.1437378)
	Part205.Color = Color3.new(1, 0, 0)
	BlockMesh206.Parent = Part205
	BlockMesh206.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh206.Scale = Vector3.new(1, 1, 0.720000029)
	Part207.Parent = Model74
	Part207.Material = Enum.Material.Neon
	Part207.Rotation = Vector3.new(-180, -55, -180)
	Part207.Anchored = true
	Part207.CanCollide = false
	Part207.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part207.CFrame = CFrame.new(20.7389431, 0.458999991, -26.508007, -0.57357645, 0, -0.819151998, 0, 1, 0, 0.819151998, 0, -0.57357645)
	Part207.BottomSurface = Enum.SurfaceType.Smooth
	Part207.TopSurface = Enum.SurfaceType.Smooth
	Part207.Position = Vector3.new(20.7389431, 0.458999991, -26.508007)
	Part207.Color = Color3.new(1, 0, 0)
	BlockMesh208.Parent = Part207
	BlockMesh208.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh208.Scale = Vector3.new(1, 1, 0.720000029)
	Part209.Parent = Model74
	Part209.Material = Enum.Material.Neon
	Part209.Rotation = Vector3.new(-180, -35, -180)
	Part209.Anchored = true
	Part209.CanCollide = false
	Part209.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part209.CFrame = CFrame.new(20.1699867, 0.458999991, -26.4404316, -0.819152117, 0, -0.573576212, 0, 1, 0, 0.573576212, 0, -0.819152117)
	Part209.BottomSurface = Enum.SurfaceType.Smooth
	Part209.TopSurface = Enum.SurfaceType.Smooth
	Part209.Position = Vector3.new(20.1699867, 0.458999991, -26.4404316)
	Part209.Color = Color3.new(1, 0, 0)
	BlockMesh210.Parent = Part209
	BlockMesh210.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh210.Scale = Vector3.new(1, 1, 0.720000029)
	Part211.Parent = Model74
	Part211.Material = Enum.Material.Neon
	Part211.Rotation = Vector3.new(0, -30, 0)
	Part211.Anchored = true
	Part211.CanCollide = false
	Part211.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part211.CFrame = CFrame.new(20.0878754, 0.458999991, -28.3210907, 0.866025388, 0, -0.5, 0, 1, 0, 0.5, 0, 0.866025388)
	Part211.BottomSurface = Enum.SurfaceType.Smooth
	Part211.TopSurface = Enum.SurfaceType.Smooth
	Part211.Position = Vector3.new(20.0878754, 0.458999991, -28.3210907)
	Part211.Color = Color3.new(1, 0, 0)
	BlockMesh212.Parent = Part211
	BlockMesh212.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh212.Scale = Vector3.new(1, 1, 0.720000029)
	Part213.Parent = Model74
	Part213.Material = Enum.Material.Neon
	Part213.Rotation = Vector3.new(0, -40, 0)
	Part213.Anchored = true
	Part213.CanCollide = false
	Part213.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part213.CFrame = CFrame.new(20.2472267, 0.458999991, -28.2095127, 0.766044319, 0, -0.642787755, 0, 1, 0, 0.642787755, 0, 0.766044319)
	Part213.BottomSurface = Enum.SurfaceType.Smooth
	Part213.TopSurface = Enum.SurfaceType.Smooth
	Part213.Position = Vector3.new(20.2472267, 0.458999991, -28.2095127)
	Part213.Color = Color3.new(1, 0, 0)
	BlockMesh214.Parent = Part213
	BlockMesh214.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh214.Scale = Vector3.new(1, 1, 0.720000029)
	Part215.Parent = Model74
	Part215.Material = Enum.Material.Neon
	Part215.Rotation = Vector3.new(0, -50, 0)
	Part215.Anchored = true
	Part215.CanCollide = false
	Part215.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part215.CFrame = CFrame.new(20.3847828, 0.458999991, -28.0719585, 0.642787576, 0, -0.766044378, 0, 1, 0, 0.766044378, 0, 0.642787576)
	Part215.BottomSurface = Enum.SurfaceType.Smooth
	Part215.TopSurface = Enum.SurfaceType.Smooth
	Part215.Position = Vector3.new(20.3847828, 0.458999991, -28.0719585)
	Part215.Color = Color3.new(1, 0, 0)
	BlockMesh216.Parent = Part215
	BlockMesh216.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh216.Scale = Vector3.new(1, 1, 0.720000029)
	Part217.Parent = Model74
	Part217.Material = Enum.Material.Neon
	Part217.Rotation = Vector3.new(-180, -50, -180)
	Part217.Anchored = true
	Part217.CanCollide = false
	Part217.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part217.CFrame = CFrame.new(20.6605587, 0.458999991, -26.4058514, -0.642787576, 0, -0.766044378, 0, 1, 0, 0.766044378, 0, -0.642787576)
	Part217.BottomSurface = Enum.SurfaceType.Smooth
	Part217.TopSurface = Enum.SurfaceType.Smooth
	Part217.Position = Vector3.new(20.6605587, 0.458999991, -26.4058514)
	Part217.Color = Color3.new(1, 0, 0)
	BlockMesh218.Parent = Part217
	BlockMesh218.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh218.Scale = Vector3.new(1, 1, 0.720000029)
	Part219.Parent = Model74
	Part219.Material = Enum.Material.Neon
	Part219.Rotation = Vector3.new(0, -80, 0)
	Part219.Anchored = true
	Part219.CanCollide = false
	Part219.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part219.CFrame = CFrame.new(20.6289215, 0.458999991, -27.5483971, 0.173648149, 0, -0.98480773, 0, 1, 0, 0.98480773, 0, 0.173648149)
	Part219.BottomSurface = Enum.SurfaceType.Smooth
	Part219.TopSurface = Enum.SurfaceType.Smooth
	Part219.Position = Vector3.new(20.6289215, 0.458999991, -27.5483971)
	Part219.Color = Color3.new(1, 0, 0)
	BlockMesh220.Parent = Part219
	BlockMesh220.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh220.Scale = Vector3.new(1, 1, 0.720000029)
	Part221.Parent = Model74
	Part221.Material = Enum.Material.Neon
	Part221.Rotation = Vector3.new(0, -70, 0)
	Part221.Anchored = true
	Part221.CanCollide = false
	Part221.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part221.CFrame = CFrame.new(20.9168625, 0.458999991, -27.8594284, 0.342019945, 0, -0.939692616, 0, 1, 0, 0.939692616, 0, 0.342019945)
	Part221.BottomSurface = Enum.SurfaceType.Smooth
	Part221.TopSurface = Enum.SurfaceType.Smooth
	Part221.Position = Vector3.new(20.9168625, 0.458999991, -27.8594284)
	Part221.Color = Color3.new(1, 0, 0)
	BlockMesh222.Parent = Part221
	BlockMesh222.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh222.Scale = Vector3.new(1, 1, 0.720000029)
	Part223.Parent = Model74
	Part223.Material = Enum.Material.Neon
	Part223.Rotation = Vector3.new(0, -50, 0)
	Part223.Anchored = true
	Part223.CanCollide = false
	Part223.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part223.CFrame = CFrame.new(20.6605587, 0.458999991, -28.30336, 0.642787576, 0, -0.766044378, 0, 1, 0, 0.766044378, 0, 0.642787576)
	Part223.BottomSurface = Enum.SurfaceType.Smooth
	Part223.TopSurface = Enum.SurfaceType.Smooth
	Part223.Position = Vector3.new(20.6605587, 0.458999991, -28.30336)
	Part223.Color = Color3.new(1, 0, 0)
	BlockMesh224.Parent = Part223
	BlockMesh224.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh224.Scale = Vector3.new(1, 1, 0.720000029)
	Part225.Parent = Model74
	Part225.Material = Enum.Material.Neon
	Part225.Rotation = Vector3.new(-180, -45, -180)
	Part225.Anchored = true
	Part225.CanCollide = false
	Part225.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part225.CFrame = CFrame.new(20.5735645, 0.458999991, -26.310915, -0.70710665, 0, -0.707106888, 0, 1, 0, 0.707106888, 0, -0.70710665)
	Part225.BottomSurface = Enum.SurfaceType.Smooth
	Part225.TopSurface = Enum.SurfaceType.Smooth
	Part225.Position = Vector3.new(20.5735645, 0.458999991, -26.310915)
	Part225.Color = Color3.new(1, 0, 0)
	BlockMesh226.Parent = Part225
	BlockMesh226.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh226.Scale = Vector3.new(1, 1, 0.720000029)
	Part227.Parent = Model74
	Part227.Material = Enum.Material.Neon
	Part227.Rotation = Vector3.new(-180, -40, -180)
	Part227.Anchored = true
	Part227.CanCollide = false
	Part227.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part227.CFrame = CFrame.new(20.2472267, 0.458999991, -26.4996986, -0.766044736, 0, -0.642787218, 0, 1, 0, 0.642787218, 0, -0.766044736)
	Part227.BottomSurface = Enum.SurfaceType.Smooth
	Part227.TopSurface = Enum.SurfaceType.Smooth
	Part227.Position = Vector3.new(20.2472267, 0.458999991, -26.4996986)
	Part227.Color = Color3.new(1, 0, 0)
	BlockMesh228.Parent = Part227
	BlockMesh228.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh228.Scale = Vector3.new(1, 1, 0.720000029)
	Part229.Parent = Model74
	Part229.Material = Enum.Material.Neon
	Part229.Rotation = Vector3.new(0, -10, 0)
	Part229.Anchored = true
	Part229.CanCollide = false
	Part229.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part229.CFrame = CFrame.new(19.7236671, 0.458999991, -28.4536514, 0.984807789, 0, -0.17364797, 0, 1, 0, 0.17364797, 0, 0.984807789)
	Part229.BottomSurface = Enum.SurfaceType.Smooth
	Part229.TopSurface = Enum.SurfaceType.Smooth
	Part229.Position = Vector3.new(19.7236671, 0.458999991, -28.4536514)
	Part229.Color = Color3.new(1, 0, 0)
	BlockMesh230.Parent = Part229
	BlockMesh230.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh230.Scale = Vector3.new(1, 1, 0.720000029)
	Part231.Parent = Model74
	Part231.Material = Enum.Material.Neon
	Part231.Rotation = Vector3.new(0, -65, 0)
	Part231.Anchored = true
	Part231.CanCollide = false
	Part231.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part231.CFrame = CFrame.new(20.8675861, 0.458999991, -27.9783897, 0.422618061, 0, -0.906307817, 0, 1, 0, 0.906307817, 0, 0.422618061)
	Part231.BottomSurface = Enum.SurfaceType.Smooth
	Part231.TopSurface = Enum.SurfaceType.Smooth
	Part231.Position = Vector3.new(20.8675861, 0.458999991, -27.9783897)
	Part231.Color = Color3.new(1, 0, 0)
	BlockMesh232.Parent = Part231
	BlockMesh232.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh232.Scale = Vector3.new(1, 1, 0.720000029)
	Part233.Parent = Model74
	Part233.Material = Enum.Material.Neon
	Part233.Rotation = Vector3.new(-180, -65, -180)
	Part233.Anchored = true
	Part233.CanCollide = false
	Part233.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part233.CFrame = CFrame.new(20.8675861, 0.458999991, -26.7308216, -0.422618151, 0, -0.906307876, 0, 1, 0, 0.906307876, 0, -0.422618151)
	Part233.BottomSurface = Enum.SurfaceType.Smooth
	Part233.TopSurface = Enum.SurfaceType.Smooth
	Part233.Position = Vector3.new(20.8675861, 0.458999991, -26.7308216)
	Part233.Color = Color3.new(1, 0, 0)
	BlockMesh234.Parent = Part233
	BlockMesh234.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh234.Scale = Vector3.new(1, 1, 0.720000029)
	Part235.Parent = Model74
	Part235.Material = Enum.Material.Neon
	Part235.Rotation = Vector3.new(-180, -65, -180)
	Part235.Anchored = true
	Part235.CanCollide = false
	Part235.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part235.CFrame = CFrame.new(20.5413151, 0.458999991, -26.8829651, -0.422618151, 0, -0.906307876, 0, 1, 0, 0.906307876, 0, -0.422618151)
	Part235.BottomSurface = Enum.SurfaceType.Smooth
	Part235.TopSurface = Enum.SurfaceType.Smooth
	Part235.Position = Vector3.new(20.5413151, 0.458999991, -26.8829651)
	Part235.Color = Color3.new(1, 0, 0)
	BlockMesh236.Parent = Part235
	BlockMesh236.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh236.Scale = Vector3.new(1, 1, 0.720000029)
	Part237.Parent = Model74
	Part237.Material = Enum.Material.Neon
	Part237.Rotation = Vector3.new(-180, -35, -180)
	Part237.Anchored = true
	Part237.CanCollide = false
	Part237.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part237.CFrame = CFrame.new(20.3764744, 0.458999991, -26.1455364, -0.819152117, 0, -0.573576212, 0, 1, 0, 0.573576212, 0, -0.819152117)
	Part237.BottomSurface = Enum.SurfaceType.Smooth
	Part237.TopSurface = Enum.SurfaceType.Smooth
	Part237.Position = Vector3.new(20.3764744, 0.458999991, -26.1455364)
	Part237.Color = Color3.new(1, 0, 0)
	BlockMesh238.Parent = Part237
	BlockMesh238.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh238.Scale = Vector3.new(1, 1, 0.720000029)
	Part239.Parent = Model74
	Part239.Material = Enum.Material.Neon
	Part239.Rotation = Vector3.new(-180, -60, -180)
	Part239.Anchored = true
	Part239.CanCollide = false
	Part239.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part239.CFrame = CFrame.new(20.4963608, 0.458999991, -26.796608, -0.500000179, 0, -0.866025329, 0, 1, 0, 0.866025329, 0, -0.500000179)
	Part239.BottomSurface = Enum.SurfaceType.Smooth
	Part239.TopSurface = Enum.SurfaceType.Smooth
	Part239.Position = Vector3.new(20.4963608, 0.458999991, -26.796608)
	Part239.Color = Color3.new(1, 0, 0)
	BlockMesh240.Parent = Part239
	BlockMesh240.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh240.Scale = Vector3.new(1, 1, 0.720000029)
	Part241.Parent = Model74
	Part241.Material = Enum.Material.Neon
	Part241.Rotation = Vector3.new(0, -20, 0)
	Part241.Anchored = true
	Part241.CanCollide = false
	Part241.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part241.CFrame = CFrame.new(19.9115696, 0.458999991, -28.4033051, 0.939692557, 0, -0.342020363, 0, 1, 0, 0.342020363, 0, 0.939692557)
	Part241.BottomSurface = Enum.SurfaceType.Smooth
	Part241.TopSurface = Enum.SurfaceType.Smooth
	Part241.Position = Vector3.new(19.9115696, 0.458999991, -28.4033051)
	Part241.Color = Color3.new(1, 0, 0)
	BlockMesh242.Parent = Part241
	BlockMesh242.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh242.Scale = Vector3.new(1, 1, 0.720000029)
	Part243.Parent = Model74
	Part243.Material = Enum.Material.Neon
	Part243.Rotation = Vector3.new(-180, -75, -180)
	Part243.Anchored = true
	Part243.CanCollide = false
	Part243.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part243.CFrame = CFrame.new(20.6078491, 0.458999991, -27.0657635, -0.258819103, 0, -0.965925813, 0, 1, 0, 0.965925813, 0, -0.258819103)
	Part243.BottomSurface = Enum.SurfaceType.Smooth
	Part243.TopSurface = Enum.SurfaceType.Smooth
	Part243.Position = Vector3.new(20.6078491, 0.458999991, -27.0657635)
	Part243.Color = Color3.new(1, 0, 0)
	BlockMesh244.Parent = Part243
	BlockMesh244.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh244.Scale = Vector3.new(1, 1, 0.720000029)
	Part245.Parent = Model74
	Part245.Material = Enum.Material.Neon
	Part245.Rotation = Vector3.new(-180, -85, -180)
	Part245.Anchored = true
	Part245.CanCollide = false
	Part245.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part245.CFrame = CFrame.new(21.0002594, 0.458999991, -27.2259636, -0.0871553719, 0, -0.99619472, 0, 1, 0, 0.99619472, 0, -0.0871553719)
	Part245.BottomSurface = Enum.SurfaceType.Smooth
	Part245.TopSurface = Enum.SurfaceType.Smooth
	Part245.Position = Vector3.new(21.0002594, 0.458999991, -27.2259636)
	Part245.Color = Color3.new(1, 0, 0)
	BlockMesh246.Parent = Part245
	BlockMesh246.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh246.Scale = Vector3.new(1, 1, 0.720000029)
	Part247.Parent = Model74
	Part247.Material = Enum.Material.Neon
	Part247.Rotation = Vector3.new(0, -85, 0)
	Part247.Anchored = true
	Part247.CanCollide = false
	Part247.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part247.CFrame = CFrame.new(20.6416283, 0.458999991, -27.45187, 0.0871559083, 0, -0.996194661, 0, 1, 0, 0.996194661, 0, 0.0871559083)
	Part247.BottomSurface = Enum.SurfaceType.Smooth
	Part247.TopSurface = Enum.SurfaceType.Smooth
	Part247.Position = Vector3.new(20.6416283, 0.458999991, -27.45187)
	Part247.Color = Color3.new(1, 0, 0)
	BlockMesh248.Parent = Part247
	BlockMesh248.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh248.Scale = Vector3.new(1, 1, 0.720000029)
	Part249.Parent = Model74
	Part249.Material = Enum.Material.Neon
	Part249.Rotation = Vector3.new(0, -10, 0)
	Part249.Anchored = true
	Part249.CanCollide = false
	Part249.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part249.CFrame = CFrame.new(19.7861805, 0.458999991, -28.8081818, 0.984807789, 0, -0.17364797, 0, 1, 0, 0.17364797, 0, 0.984807789)
	Part249.BottomSurface = Enum.SurfaceType.Smooth
	Part249.TopSurface = Enum.SurfaceType.Smooth
	Part249.Position = Vector3.new(19.7861805, 0.458999991, -28.8081818)
	Part249.Color = Color3.new(1, 0, 0)
	BlockMesh250.Parent = Part249
	BlockMesh250.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh250.Scale = Vector3.new(1, 1, 0.720000029)
	Part251.Parent = Model74
	Part251.Material = Enum.Material.Neon
	Part251.Rotation = Vector3.new(0, -85, 0)
	Part251.Anchored = true
	Part251.CanCollide = false
	Part251.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part251.CFrame = CFrame.new(21.0002594, 0.458999991, -27.4832497, 0.0871559083, 0, -0.996194661, 0, 1, 0, 0.996194661, 0, 0.0871559083)
	Part251.BottomSurface = Enum.SurfaceType.Smooth
	Part251.TopSurface = Enum.SurfaceType.Smooth
	Part251.Position = Vector3.new(21.0002594, 0.458999991, -27.4832497)
	Part251.Color = Color3.new(1, 0, 0)
	BlockMesh252.Parent = Part251
	BlockMesh252.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh252.Scale = Vector3.new(1, 1, 0.720000029)
	Part253.Parent = Model74
	Part253.Material = Enum.Material.Neon
	Part253.Rotation = Vector3.new(0, -25, 0)
	Part253.Anchored = true
	Part253.CanCollide = false
	Part253.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part253.CFrame = CFrame.new(20.1536617, 0.458999991, -28.6923161, 0.906307757, 0, -0.42261827, 0, 1, 0, 0.42261827, 0, 0.906307757)
	Part253.BottomSurface = Enum.SurfaceType.Smooth
	Part253.TopSurface = Enum.SurfaceType.Smooth
	Part253.Position = Vector3.new(20.1536617, 0.458999991, -28.6923161)
	Part253.Color = Color3.new(1, 0, 0)
	BlockMesh254.Parent = Part253
	BlockMesh254.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh254.Scale = Vector3.new(1, 1, 0.720000029)
	Part255.Parent = Model74
	Part255.Material = Enum.Material.Neon
	Part255.Rotation = Vector3.new(0, -5, 0)
	Part255.Anchored = true
	Part255.CanCollide = false
	Part255.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part255.CFrame = CFrame.new(19.627142, 0.458999991, -28.4663601, 0.99619472, 0, -0.0871555507, 0, 1, 0, 0.0871555507, 0, 0.99619472)
	Part255.BottomSurface = Enum.SurfaceType.Smooth
	Part255.TopSurface = Enum.SurfaceType.Smooth
	Part255.Position = Vector3.new(19.627142, 0.458999991, -28.4663601)
	Part255.Color = Color3.new(1, 0, 0)
	BlockMesh256.Parent = Part255
	BlockMesh256.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh256.Scale = Vector3.new(1, 1, 0.720000029)
	Part257.Parent = Model74
	Part257.Material = Enum.Material.Neon
	Part257.Rotation = Vector3.new(0, -55, 0)
	Part257.Anchored = true
	Part257.CanCollide = false
	Part257.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part257.CFrame = CFrame.new(20.4440498, 0.458999991, -27.9947166, 0.573576629, 0, -0.819151938, 0, 1, 0, 0.819151938, 0, 0.573576629)
	Part257.BottomSurface = Enum.SurfaceType.Smooth
	Part257.TopSurface = Enum.SurfaceType.Smooth
	Part257.Position = Vector3.new(20.4440498, 0.458999991, -27.9947166)
	Part257.Color = Color3.new(1, 0, 0)
	BlockMesh258.Parent = Part257
	BlockMesh258.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh258.Scale = Vector3.new(1, 1, 0.720000029)
	Part259.Parent = Model74
	Part259.Material = Enum.Material.Neon
	Part259.Rotation = Vector3.new(-180, -70, -180)
	Part259.Anchored = true
	Part259.CanCollide = false
	Part259.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part259.CFrame = CFrame.new(20.5785732, 0.458999991, -26.9729118, -0.342020154, 0, -0.939692557, 0, 1, 0, 0.939692557, 0, -0.342020154)
	Part259.BottomSurface = Enum.SurfaceType.Smooth
	Part259.TopSurface = Enum.SurfaceType.Smooth
	Part259.Position = Vector3.new(20.5785732, 0.458999991, -26.9729118)
	Part259.Color = Color3.new(1, 0, 0)
	BlockMesh260.Parent = Part259
	BlockMesh260.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh260.Scale = Vector3.new(1, 1, 0.720000029)
	Part261.Parent = Model74
	Part261.Material = Enum.Material.Neon
	Part261.Rotation = Vector3.new(0, -30, 0)
	Part261.Anchored = true
	Part261.CanCollide = false
	Part261.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part261.CFrame = CFrame.new(20.2678757, 0.458999991, -28.6328602, 0.866025388, 0, -0.5, 0, 1, 0, 0.5, 0, 0.866025388)
	Part261.BottomSurface = Enum.SurfaceType.Smooth
	Part261.TopSurface = Enum.SurfaceType.Smooth
	Part261.Position = Vector3.new(20.2678757, 0.458999991, -28.6328602)
	Part261.Color = Color3.new(1, 0, 0)
	BlockMesh262.Parent = Part261
	BlockMesh262.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh262.Scale = Vector3.new(1, 1, 0.720000029)
	Part263.Parent = Model74
	Part263.Material = Enum.Material.Neon
	Part263.Rotation = Vector3.new(-180, -80, -180)
	Part263.Anchored = true
	Part263.CanCollide = false
	Part263.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part263.CFrame = CFrame.new(20.6289215, 0.458999991, -27.1608143, -0.173648432, 0, -0.98480767, 0, 1, 0, 0.98480767, 0, -0.173648432)
	Part263.BottomSurface = Enum.SurfaceType.Smooth
	Part263.TopSurface = Enum.SurfaceType.Smooth
	Part263.Position = Vector3.new(20.6289215, 0.458999991, -27.1608143)
	Part263.Color = Color3.new(1, 0, 0)
	BlockMesh264.Parent = Part263
	BlockMesh264.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh264.Scale = Vector3.new(1, 1, 0.720000029)
	Part265.Parent = Model74
	Part265.Material = Enum.Material.Neon
	Part265.Rotation = Vector3.new(-180, -70, -180)
	Part265.Anchored = true
	Part265.CanCollide = false
	Part265.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part265.CFrame = CFrame.new(20.9168625, 0.458999991, -26.8497849, -0.342020154, 0, -0.939692557, 0, 1, 0, 0.939692557, 0, -0.342020154)
	Part265.BottomSurface = Enum.SurfaceType.Smooth
	Part265.TopSurface = Enum.SurfaceType.Smooth
	Part265.Position = Vector3.new(20.9168625, 0.458999991, -26.8497849)
	Part265.Color = Color3.new(1, 0, 0)
	BlockMesh266.Parent = Part265
	BlockMesh266.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh266.Scale = Vector3.new(1, 1, 0.720000029)
	Part267.Parent = Model74
	Part267.Material = Enum.Material.Neon
	Part267.Rotation = Vector3.new(-180, -85, -180)
	Part267.Anchored = true
	Part267.CanCollide = false
	Part267.Size = Vector3.new(0.179999992, 0.144000009, 0.0500000007)
	Part267.CFrame = CFrame.new(20.6416283, 0.458999991, -27.2573414, -0.0871553719, 0, -0.99619472, 0, 1, 0, 0.99619472, 0, -0.0871553719)
	Part267.BottomSurface = Enum.SurfaceType.Smooth
	Part267.TopSurface = Enum.SurfaceType.Smooth
	Part267.Position = Vector3.new(20.6416283, 0.458999991, -27.2573414)
	Part267.Color = Color3.new(1, 0, 0)
	BlockMesh268.Parent = Part267
	BlockMesh268.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh268.Scale = Vector3.new(1, 1, 0.720000029)
	Part269.Parent = Model74
	Part269.Material = Enum.Material.Neon
	Part269.Rotation = Vector3.new(90, 0, -30.9599991)
	Part269.Anchored = true
	Part269.CanCollide = false
	Part269.Size = Vector3.new(0.365828931, 0.0500000007, 0.144000009)
	Part269.CFrame = CFrame.new(19.3108101, 0.458999991, -28.7441921, 0.857492983, 0.514495611, 0, 0, 0, -1, -0.514495611, 0.857492983, 0)
	Part269.BottomSurface = Enum.SurfaceType.Smooth
	Part269.TopSurface = Enum.SurfaceType.Smooth
	Part269.Position = Vector3.new(19.3108101, 0.458999991, -28.7441921)
	Part269.Color = Color3.new(1, 0, 0)
	BlockMesh270.Parent = Part269
	BlockMesh270.Scale = Vector3.new(1, 0.720000029, 1)
	BlockMesh270.Scale = Vector3.new(1, 0.720000029, 1)
	Part271.Parent = Model74
	Part271.Material = Enum.Material.Neon
	Part271.Rotation = Vector3.new(-90, 0, -30.9599991)
	Part271.Anchored = true
	Part271.CanCollide = false
	Part271.Size = Vector3.new(0.365828931, 0.0500000007, 0.144000009)
	Part271.CFrame = CFrame.new(19.3108101, 0.458999991, -28.5570183, 0.857492983, 0.514495611, 0, 0, 0, 1, 0.514495611, -0.857492983, 0)
	Part271.BottomSurface = Enum.SurfaceType.Smooth
	Part271.TopSurface = Enum.SurfaceType.Smooth
	Part271.Position = Vector3.new(19.3108101, 0.458999991, -28.5570183)
	Part271.Color = Color3.new(1, 0, 0)
	BlockMesh272.Parent = Part271
	BlockMesh272.Scale = Vector3.new(1, 0.720000029, 1)
	BlockMesh272.Scale = Vector3.new(1, 0.720000029, 1)
	Part273.Parent = Model74
	Part273.Material = Enum.Material.Neon
	Part273.Rotation = Vector3.new(90, 0, -174.039993)
	Part273.Anchored = true
	Part273.CanCollide = false
	Part273.Size = Vector3.new(0.383828521, 0.0500000007, 0.144000009)
	Part273.CFrame = CFrame.new(19.9096489, 0.458999991, -26.0035667, -0.994587779, 0.103899181, 0, 0, 0, -1, -0.103899181, -0.994587779, 0)
	Part273.BottomSurface = Enum.SurfaceType.Smooth
	Part273.TopSurface = Enum.SurfaceType.Smooth
	Part273.Position = Vector3.new(19.9096489, 0.458999991, -26.0035667)
	Part273.Color = Color3.new(1, 0, 0)
	BlockMesh274.Parent = Part273
	BlockMesh274.Scale = Vector3.new(1, 0.720000029, 1)
	BlockMesh274.Scale = Vector3.new(1, 0.720000029, 1)
	Part275.Parent = Model74
	Part275.Material = Enum.Material.Neon
	Part275.Rotation = Vector3.new(90, 0, -55.9599991)
	Part275.Anchored = true
	Part275.CanCollide = false
	Part275.Size = Vector3.new(0.383828819, 0.0500000007, 0.144000009)
	Part275.CFrame = CFrame.new(19.8344593, 0.458999991, -26.1648102, 0.559716702, 0.828684032, 0, 0, 0, -1, -0.828684032, 0.559716702, 0)
	Part275.BottomSurface = Enum.SurfaceType.Smooth
	Part275.TopSurface = Enum.SurfaceType.Smooth
	Part275.Position = Vector3.new(19.8344593, 0.458999991, -26.1648102)
	Part275.Color = Color3.new(1, 0, 0)
	BlockMesh276.Parent = Part275
	BlockMesh276.Scale = Vector3.new(1, 0.720000029, 1)
	BlockMesh276.Scale = Vector3.new(1, 0.720000029, 1)
	Part277.Parent = Model74
	Part277.Material = Enum.Material.Neon
	Part277.Rotation = Vector3.new(-180, -40, -180)
	Part277.Anchored = true
	Part277.CanCollide = false
	Part277.Size = Vector3.new(0.179999992, 0.0500000007, 0.135000035)
	Part277.CFrame = CFrame.new(20.4063168, 0.458999991, -26.3101044, -0.766044736, 0, -0.642787218, 0, 1, 0, 0.642787218, 0, -0.766044736)
	Part277.BottomSurface = Enum.SurfaceType.Smooth
	Part277.TopSurface = Enum.SurfaceType.Smooth
	Part277.Position = Vector3.new(20.4063168, 0.458999991, -26.3101044)
	Part277.Color = Color3.new(1, 0, 0)
	BlockMesh278.Parent = Part277
	BlockMesh278.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh278.Scale = Vector3.new(1, 0.900000095, 1)
	Model279.Name = "a"
	Model279.Parent = Model0
	Model280.Name = "a"
	Model280.Parent = Model279
	Model281.Name = "a"
	Model281.Parent = Model280
	Part282.Parent = Model281
	Part282.Anchored = true
	Part282.CanCollide = false
	Part282.Size = Vector3.new(0.10799998, 0.108000003, 3.24000001)
	Part282.CFrame = CFrame.new(19.2058754, 0.422999978, -24.0246048, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part282.BottomSurface = Enum.SurfaceType.Smooth
	Part282.TopSurface = Enum.SurfaceType.Smooth
	Part282.Position = Vector3.new(19.2058754, 0.422999978, -24.0246048)
	Part282.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part283.Parent = Model281
	Part283.Anchored = true
	Part283.CanCollide = false
	Part283.Size = Vector3.new(0.108000003, 0.108000003, 3.96000004)
	Part283.CFrame = CFrame.new(19.565876, 0.422999978, -23.6646061, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part283.BottomSurface = Enum.SurfaceType.Smooth
	Part283.TopSurface = Enum.SurfaceType.Smooth
	Part283.Position = Vector3.new(19.565876, 0.422999978, -23.6646061)
	Part283.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part284.Parent = Model281
	Part284.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part284.Anchored = true
	Part284.CanCollide = false
	Part284.Size = Vector3.new(0.80498451, 0.108000003, 0.108000003)
	Part284.CFrame = CFrame.new(19.3801746, 0.422999978, -22.0687561, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part284.BottomSurface = Enum.SurfaceType.Smooth
	Part284.TopSurface = Enum.SurfaceType.Smooth
	Part284.Position = Vector3.new(19.3801746, 0.422999978, -22.0687561)
	Part284.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part285.Name = "asd"
	Part285.Parent = Model281
	Part285.Anchored = true
	Part285.CanCollide = false
	Part285.Size = Vector3.new(0.252000004, 0.108000003, 0.108000003)
	Part285.CFrame = CFrame.new(19.3858757, 0.422999978, -25.5906067, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part285.BottomSurface = Enum.SurfaceType.Smooth
	Part285.TopSurface = Enum.SurfaceType.Smooth
	Part285.Position = Vector3.new(19.3858757, 0.422999978, -25.5906067)
	Part285.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Model286.Name = "b"
	Model286.Parent = Model280
	Part287.Parent = Model286
	Part287.Material = Enum.Material.Neon
	Part287.Anchored = true
	Part287.CanCollide = false
	Part287.Size = Vector3.new(0.0500000007, 0.144000009, 3.20399976)
	Part287.CFrame = CFrame.new(19.2058754, 0.422999978, -24.0066071, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part287.BottomSurface = Enum.SurfaceType.Smooth
	Part287.TopSurface = Enum.SurfaceType.Smooth
	Part287.Position = Vector3.new(19.2058754, 0.422999978, -24.0066071)
	Part287.Color = Color3.new(1, 0, 0)
	BlockMesh288.Parent = Part287
	BlockMesh288.Scale = Vector3.new(0.719999671, 1, 1)
	BlockMesh288.Scale = Vector3.new(0.719999671, 1, 1)
	Part289.Parent = Model286
	Part289.Material = Enum.Material.Neon
	Part289.Anchored = true
	Part289.CanCollide = false
	Part289.Size = Vector3.new(0.323999971, 0.144000009, 0.0500000007)
	Part289.CFrame = CFrame.new(19.3858757, 0.422999978, -25.5906067, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part289.BottomSurface = Enum.SurfaceType.Smooth
	Part289.TopSurface = Enum.SurfaceType.Smooth
	Part289.Position = Vector3.new(19.3858757, 0.422999978, -25.5906067)
	Part289.Color = Color3.new(1, 0, 0)
	BlockMesh290.Parent = Part289
	BlockMesh290.Scale = Vector3.new(1, 1, 0.719994426)
	BlockMesh290.Scale = Vector3.new(1, 1, 0.719994426)
	Part291.Parent = Model286
	Part291.Material = Enum.Material.Neon
	Part291.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part291.Anchored = true
	Part291.CanCollide = false
	Part291.Size = Vector3.new(0.80498451, 0.0500000007, 0.144000009)
	Part291.CFrame = CFrame.new(19.3801746, 0.422999978, -22.0687561, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part291.BottomSurface = Enum.SurfaceType.Smooth
	Part291.TopSurface = Enum.SurfaceType.Smooth
	Part291.Position = Vector3.new(19.3801746, 0.422999978, -22.0687561)
	Part291.Color = Color3.new(1, 0, 0)
	BlockMesh292.Parent = Part291
	BlockMesh292.Scale = Vector3.new(1, 0.720000029, 1)
	BlockMesh292.Scale = Vector3.new(1, 0.720000029, 1)
	Part293.Parent = Model286
	Part293.Material = Enum.Material.Neon
	Part293.Anchored = true
	Part293.CanCollide = false
	Part293.Size = Vector3.new(0.0500000007, 0.144000009, 3.88799953)
	Part293.CFrame = CFrame.new(19.565876, 0.422999978, -23.6646061, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part293.BottomSurface = Enum.SurfaceType.Smooth
	Part293.TopSurface = Enum.SurfaceType.Smooth
	Part293.Position = Vector3.new(19.565876, 0.422999978, -23.6646061)
	Part293.Color = Color3.new(1, 0, 0)
	BlockMesh294.Parent = Part293
	BlockMesh294.Scale = Vector3.new(0.720000088, 1, 1)
	BlockMesh294.Scale = Vector3.new(0.720000088, 1, 1)
	Part295.Parent = Model286
	Part295.Material = Enum.Material.Neon
	Part295.Anchored = true
	Part295.CanCollide = false
	Part295.Size = Vector3.new(0.135000005, 0.0500000007, 3.60900021)
	Part295.CFrame = CFrame.new(19.4443741, 0.422999978, -23.7906075, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part295.BottomSurface = Enum.SurfaceType.Smooth
	Part295.TopSurface = Enum.SurfaceType.Smooth
	Part295.Position = Vector3.new(19.4443741, 0.422999978, -23.7906075)
	Part295.Color = Color3.new(1, 0, 0)
	BlockMesh296.Parent = Part295
	BlockMesh296.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh296.Scale = Vector3.new(1, 0.900000095, 1)
	Part297.Parent = Model286
	Part297.Material = Enum.Material.Neon
	Part297.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part297.Anchored = true
	Part297.CanCollide = false
	Part297.Size = Vector3.new(0.120984495, 0.0540000014, 0.0500000007)
	Part297.CFrame = CFrame.new(19.4948845, 0.422999978, -21.9802074, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part297.BottomSurface = Enum.SurfaceType.Smooth
	Part297.TopSurface = Enum.SurfaceType.Smooth
	Part297.Position = Vector3.new(19.4948845, 0.422999978, -21.9802074)
	Part297.Color = Color3.new(1, 0, 0)
	BlockMesh298.Parent = Part297
	BlockMesh298.Scale = Vector3.new(1, 1, 0.900000095)
	BlockMesh298.Scale = Vector3.new(1, 1, 0.900000095)
	Model299.Name = "b"
	Model299.Parent = Model279
	Model300.Name = "b"
	Model300.Parent = Model299
	Part301.Parent = Model300
	Part301.Material = Enum.Material.Neon
	Part301.Anchored = true
	Part301.CanCollide = false
	Part301.Size = Vector3.new(0.135000005, 0.0500000007, 4.68900013)
	Part301.CFrame = CFrame.new(19.4443741, 0.422999978, -16.770607, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part301.BottomSurface = Enum.SurfaceType.Smooth
	Part301.TopSurface = Enum.SurfaceType.Smooth
	Part301.Position = Vector3.new(19.4443741, 0.422999978, -16.770607)
	Part301.Color = Color3.new(1, 0, 0)
	BlockMesh302.Parent = Part301
	BlockMesh302.Scale = Vector3.new(1, 0.900000095, 1)
	BlockMesh302.Scale = Vector3.new(1, 0.900000095, 1)
	Part303.Parent = Model300
	Part303.Material = Enum.Material.Neon
	Part303.Anchored = true
	Part303.CanCollide = false
	Part303.Size = Vector3.new(0.0500000007, 0.144000009, 4.28399944)
	Part303.CFrame = CFrame.new(19.2058754, 0.422999978, -16.9866066, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part303.BottomSurface = Enum.SurfaceType.Smooth
	Part303.TopSurface = Enum.SurfaceType.Smooth
	Part303.Position = Vector3.new(19.2058754, 0.422999978, -16.9866066)
	Part303.Color = Color3.new(1, 0, 0)
	BlockMesh304.Parent = Part303
	BlockMesh304.Scale = Vector3.new(0.719999671, 1, 1)
	BlockMesh304.Scale = Vector3.new(0.719999671, 1, 1)
	Part305.Parent = Model300
	Part305.Material = Enum.Material.Neon
	Part305.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part305.Anchored = true
	Part305.CanCollide = false
	Part305.Size = Vector3.new(0.120984495, 0.0540000014, 0.0500000007)
	Part305.CFrame = CFrame.new(19.4948845, 0.422999978, -14.420208, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part305.BottomSurface = Enum.SurfaceType.Smooth
	Part305.TopSurface = Enum.SurfaceType.Smooth
	Part305.Position = Vector3.new(19.4948845, 0.422999978, -14.420208)
	Part305.Color = Color3.new(1, 0, 0)
	BlockMesh306.Parent = Part305
	BlockMesh306.Scale = Vector3.new(1, 1, 0.900000095)
	BlockMesh306.Scale = Vector3.new(1, 1, 0.900000095)
	Part307.Parent = Model300
	Part307.Material = Enum.Material.Neon
	Part307.Anchored = true
	Part307.CanCollide = false
	Part307.Size = Vector3.new(0.0500000007, 0.144000009, 4.96799994)
	Part307.CFrame = CFrame.new(19.565876, 0.422999978, -16.6446075, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part307.BottomSurface = Enum.SurfaceType.Smooth
	Part307.TopSurface = Enum.SurfaceType.Smooth
	Part307.Position = Vector3.new(19.565876, 0.422999978, -16.6446075)
	Part307.Color = Color3.new(1, 0, 0)
	BlockMesh308.Parent = Part307
	BlockMesh308.Scale = Vector3.new(0.720000088, 1, 1)
	BlockMesh308.Scale = Vector3.new(0.720000088, 1, 1)
	Part309.Parent = Model300
	Part309.Material = Enum.Material.Neon
	Part309.Anchored = true
	Part309.CanCollide = false
	Part309.Size = Vector3.new(0.359999985, 0.144000009, 0.0500000007)
	Part309.CFrame = CFrame.new(19.3858757, 0.422999978, -19.1106071, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part309.BottomSurface = Enum.SurfaceType.Smooth
	Part309.TopSurface = Enum.SurfaceType.Smooth
	Part309.Position = Vector3.new(19.3858757, 0.422999978, -19.1106071)
	Part309.Color = Color3.new(1, 0, 0)
	BlockMesh310.Parent = Part309
	BlockMesh310.Scale = Vector3.new(1, 1, 0.720000029)
	BlockMesh310.Scale = Vector3.new(1, 1, 0.720000029)
	Part311.Parent = Model300
	Part311.Material = Enum.Material.Neon
	Part311.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part311.Anchored = true
	Part311.CanCollide = false
	Part311.Size = Vector3.new(0.80498451, 0.0500000007, 0.144000009)
	Part311.CFrame = CFrame.new(19.3801746, 0.422999978, -14.5087566, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part311.BottomSurface = Enum.SurfaceType.Smooth
	Part311.TopSurface = Enum.SurfaceType.Smooth
	Part311.Position = Vector3.new(19.3801746, 0.422999978, -14.5087566)
	Part311.Color = Color3.new(1, 0, 0)
	BlockMesh312.Parent = Part311
	BlockMesh312.Scale = Vector3.new(1, 0.720000029, 1)
	BlockMesh312.Scale = Vector3.new(1, 0.720000029, 1)
	Model313.Name = "a"
	Model313.Parent = Model299
	Part314.Parent = Model313
	Part314.Anchored = true
	Part314.CanCollide = false
	Part314.Size = Vector3.new(0.108000003, 0.108000003, 5.03999996)
	Part314.CFrame = CFrame.new(19.565876, 0.422999978, -16.6446075, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part314.BottomSurface = Enum.SurfaceType.Smooth
	Part314.TopSurface = Enum.SurfaceType.Smooth
	Part314.Position = Vector3.new(19.565876, 0.422999978, -16.6446075)
	Part314.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part315.Parent = Model313
	Part315.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part315.Anchored = true
	Part315.CanCollide = false
	Part315.Size = Vector3.new(0.80498451, 0.108000003, 0.108000003)
	Part315.CFrame = CFrame.new(19.3801746, 0.422999978, -14.5087566, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part315.BottomSurface = Enum.SurfaceType.Smooth
	Part315.TopSurface = Enum.SurfaceType.Smooth
	Part315.Position = Vector3.new(19.3801746, 0.422999978, -14.5087566)
	Part315.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part316.Parent = Model313
	Part316.Anchored = true
	Part316.CanCollide = false
	Part316.Size = Vector3.new(0.10799998, 0.108000003, 4.32000017)
	Part316.CFrame = CFrame.new(19.2058754, 0.422999978, -17.0046062, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part316.BottomSurface = Enum.SurfaceType.Smooth
	Part316.TopSurface = Enum.SurfaceType.Smooth
	Part316.Position = Vector3.new(19.2058754, 0.422999978, -17.0046062)
	Part316.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part317.Name = "asd"
	Part317.Parent = Model313
	Part317.Anchored = true
	Part317.CanCollide = false
	Part317.Size = Vector3.new(0.252000004, 0.108000003, 0.108000003)
	Part317.CFrame = CFrame.new(19.3858757, 0.422999978, -19.1106071, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part317.BottomSurface = Enum.SurfaceType.Smooth
	Part317.TopSurface = Enum.SurfaceType.Smooth
	Part317.Position = Vector3.new(19.3858757, 0.422999978, -19.1106071)
	Part317.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Model318.Name = "b"
	Model318.Parent = Model0
	Model319.Name = "b"
	Model319.Parent = Model318
	Model320.Name = "b"
	Model320.Parent = Model319
	Part321.Parent = Model320
	Part321.Material = Enum.Material.Neon
	Part321.Anchored = true
	Part321.CanCollide = false
	Part321.Size = Vector3.new(0.121499985, 0.0500000007, 4.22009993)
	Part321.CFrame = CFrame.new(17.6385269, 0.422999978, -16.758007, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part321.BottomSurface = Enum.SurfaceType.Smooth
	Part321.TopSurface = Enum.SurfaceType.Smooth
	Part321.Position = Vector3.new(17.6385269, 0.422999978, -16.758007)
	Part321.Color = Color3.new(1, 0, 0)
	BlockMesh322.Parent = Part321
	BlockMesh322.Scale = Vector3.new(1, 0.810000062, 1)
	BlockMesh322.Scale = Vector3.new(1, 0.810000062, 1)
	Part323.Parent = Model320
	Part323.Material = Enum.Material.Neon
	Part323.Anchored = true
	Part323.CanCollide = false
	Part323.Size = Vector3.new(0.0500000007, 0.129599988, 3.85559988)
	Part323.CFrame = CFrame.new(17.4238758, 0.422999978, -16.9524059, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part323.BottomSurface = Enum.SurfaceType.Smooth
	Part323.TopSurface = Enum.SurfaceType.Smooth
	Part323.Position = Vector3.new(17.4238758, 0.422999978, -16.9524059)
	Part323.Color = Color3.new(1, 0, 0)
	BlockMesh324.Parent = Part323
	BlockMesh324.Scale = Vector3.new(0.647999644, 1, 1)
	BlockMesh324.Scale = Vector3.new(0.647999644, 1, 1)
	Part325.Parent = Model320
	Part325.Material = Enum.Material.Neon
	Part325.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part325.Anchored = true
	Part325.CanCollide = false
	Part325.Size = Vector3.new(0.108886041, 0.0500000007, 0.0500000007)
	Part325.CFrame = CFrame.new(17.6839848, 0.422999978, -14.6426468, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part325.BottomSurface = Enum.SurfaceType.Smooth
	Part325.TopSurface = Enum.SurfaceType.Smooth
	Part325.Position = Vector3.new(17.6839848, 0.422999978, -14.6426468)
	Part325.Color = Color3.new(1, 0, 0)
	BlockMesh326.Parent = Part325
	BlockMesh326.Scale = Vector3.new(1, 0.972000003, 0.810000062)
	BlockMesh326.Scale = Vector3.new(1, 0.972000003, 0.810000062)
	Part327.Parent = Model320
	Part327.Material = Enum.Material.Neon
	Part327.Anchored = true
	Part327.CanCollide = false
	Part327.Size = Vector3.new(0.0500000007, 0.129599988, 4.47119999)
	Part327.CFrame = CFrame.new(17.7478771, 0.422999978, -16.6446075, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part327.BottomSurface = Enum.SurfaceType.Smooth
	Part327.TopSurface = Enum.SurfaceType.Smooth
	Part327.Position = Vector3.new(17.7478771, 0.422999978, -16.6446075)
	Part327.Color = Color3.new(1, 0, 0)
	BlockMesh328.Parent = Part327
	BlockMesh328.Scale = Vector3.new(0.648000002, 1, 1)
	BlockMesh328.Scale = Vector3.new(0.648000002, 1, 1)
	Part329.Parent = Model320
	Part329.Material = Enum.Material.Neon
	Part329.Anchored = true
	Part329.CanCollide = false
	Part329.Size = Vector3.new(0.323999971, 0.129599988, 0.0500000007)
	Part329.CFrame = CFrame.new(17.5858765, 0.422999978, -18.864006, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part329.BottomSurface = Enum.SurfaceType.Smooth
	Part329.TopSurface = Enum.SurfaceType.Smooth
	Part329.Position = Vector3.new(17.5858765, 0.422999978, -18.864006)
	Part329.Color = Color3.new(1, 0, 0)
	BlockMesh330.Parent = Part329
	BlockMesh330.Scale = Vector3.new(1, 1, 0.648000002)
	BlockMesh330.Scale = Vector3.new(1, 1, 0.648000002)
	Part331.Parent = Model320
	Part331.Material = Enum.Material.Neon
	Part331.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part331.Anchored = true
	Part331.CanCollide = false
	Part331.Size = Vector3.new(0.724486053, 0.0500000007, 0.129599988)
	Part331.CFrame = CFrame.new(17.5807457, 0.422999978, -14.7223406, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part331.BottomSurface = Enum.SurfaceType.Smooth
	Part331.TopSurface = Enum.SurfaceType.Smooth
	Part331.Position = Vector3.new(17.5807457, 0.422999978, -14.7223406)
	Part331.Color = Color3.new(1, 0, 0)
	BlockMesh332.Parent = Part331
	BlockMesh332.Scale = Vector3.new(1, 0.648000002, 1)
	BlockMesh332.Scale = Vector3.new(1, 0.648000002, 1)
	Model333.Name = "a"
	Model333.Parent = Model319
	Part334.Parent = Model333
	Part334.Anchored = true
	Part334.CanCollide = false
	Part334.Size = Vector3.new(0.0971999988, 0.0971999988, 4.53599977)
	Part334.CFrame = CFrame.new(17.7478771, 0.422999978, -16.6446075, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part334.BottomSurface = Enum.SurfaceType.Smooth
	Part334.TopSurface = Enum.SurfaceType.Smooth
	Part334.Position = Vector3.new(17.7478771, 0.422999978, -16.6446075)
	Part334.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part335.Parent = Model333
	Part335.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part335.Anchored = true
	Part335.CanCollide = false
	Part335.Size = Vector3.new(0.724486053, 0.0971999988, 0.0971999988)
	Part335.CFrame = CFrame.new(17.5807457, 0.422999978, -14.7223406, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part335.BottomSurface = Enum.SurfaceType.Smooth
	Part335.TopSurface = Enum.SurfaceType.Smooth
	Part335.Position = Vector3.new(17.5807457, 0.422999978, -14.7223406)
	Part335.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part336.Parent = Model333
	Part336.Anchored = true
	Part336.CanCollide = false
	Part336.Size = Vector3.new(0.0971999764, 0.0971999988, 3.88799953)
	Part336.CFrame = CFrame.new(17.4238758, 0.422999978, -16.968605, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part336.BottomSurface = Enum.SurfaceType.Smooth
	Part336.TopSurface = Enum.SurfaceType.Smooth
	Part336.Position = Vector3.new(17.4238758, 0.422999978, -16.968605)
	Part336.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part337.Name = "asd"
	Part337.Parent = Model333
	Part337.Anchored = true
	Part337.CanCollide = false
	Part337.Size = Vector3.new(0.226799995, 0.0971999988, 0.0971999988)
	Part337.CFrame = CFrame.new(17.5858765, 0.422999978, -18.864006, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part337.BottomSurface = Enum.SurfaceType.Smooth
	Part337.TopSurface = Enum.SurfaceType.Smooth
	Part337.Position = Vector3.new(17.5858765, 0.422999978, -18.864006)
	Part337.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Model338.Name = "a"
	Model338.Parent = Model318
	Model339.Name = "a"
	Model339.Parent = Model338
	Part340.Parent = Model339
	Part340.Anchored = true
	Part340.CanCollide = false
	Part340.Size = Vector3.new(0.0971999764, 0.0971999988, 2.91599965)
	Part340.CFrame = CFrame.new(17.4238758, 0.422999978, -23.9886055, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part340.BottomSurface = Enum.SurfaceType.Smooth
	Part340.TopSurface = Enum.SurfaceType.Smooth
	Part340.Position = Vector3.new(17.4238758, 0.422999978, -23.9886055)
	Part340.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part341.Parent = Model339
	Part341.Anchored = true
	Part341.CanCollide = false
	Part341.Size = Vector3.new(0.0971999988, 0.0971999988, 3.56399965)
	Part341.CFrame = CFrame.new(17.7478771, 0.422999978, -23.6646061, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part341.BottomSurface = Enum.SurfaceType.Smooth
	Part341.TopSurface = Enum.SurfaceType.Smooth
	Part341.Position = Vector3.new(17.7478771, 0.422999978, -23.6646061)
	Part341.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part342.Parent = Model339
	Part342.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part342.Anchored = true
	Part342.CanCollide = false
	Part342.Size = Vector3.new(0.724486053, 0.0971999988, 0.0971999988)
	Part342.CFrame = CFrame.new(17.5807457, 0.422999978, -22.2283401, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part342.BottomSurface = Enum.SurfaceType.Smooth
	Part342.TopSurface = Enum.SurfaceType.Smooth
	Part342.Position = Vector3.new(17.5807457, 0.422999978, -22.2283401)
	Part342.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part343.Name = "asd"
	Part343.Parent = Model339
	Part343.Anchored = true
	Part343.CanCollide = false
	Part343.Size = Vector3.new(0.226799995, 0.0971999988, 0.0971999988)
	Part343.CFrame = CFrame.new(17.5858765, 0.422999978, -25.3980064, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part343.BottomSurface = Enum.SurfaceType.Smooth
	Part343.TopSurface = Enum.SurfaceType.Smooth
	Part343.Position = Vector3.new(17.5858765, 0.422999978, -25.3980064)
	Part343.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Model344.Name = "b"
	Model344.Parent = Model338
	Part345.Parent = Model344
	Part345.Material = Enum.Material.Neon
	Part345.Anchored = true
	Part345.CanCollide = false
	Part345.Size = Vector3.new(0.0500000007, 0.129599988, 2.88359976)
	Part345.CFrame = CFrame.new(17.4238758, 0.422999978, -23.9724064, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part345.BottomSurface = Enum.SurfaceType.Smooth
	Part345.TopSurface = Enum.SurfaceType.Smooth
	Part345.Position = Vector3.new(17.4238758, 0.422999978, -23.9724064)
	Part345.Color = Color3.new(1, 0, 0)
	BlockMesh346.Parent = Part345
	BlockMesh346.Scale = Vector3.new(0.647999644, 1, 1)
	BlockMesh346.Scale = Vector3.new(0.647999644, 1, 1)
	Part347.Parent = Model344
	Part347.Material = Enum.Material.Neon
	Part347.Anchored = true
	Part347.CanCollide = false
	Part347.Size = Vector3.new(0.291599959, 0.129599988, 0.0500000007)
	Part347.CFrame = CFrame.new(17.5858765, 0.422999978, -25.3980064, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part347.BottomSurface = Enum.SurfaceType.Smooth
	Part347.TopSurface = Enum.SurfaceType.Smooth
	Part347.Position = Vector3.new(17.5858765, 0.422999978, -25.3980064)
	Part347.Color = Color3.new(1, 0, 0)
	BlockMesh348.Parent = Part347
	BlockMesh348.Scale = Vector3.new(1, 1, 0.647995114)
	BlockMesh348.Scale = Vector3.new(1, 1, 0.647995114)
	Part349.Parent = Model344
	Part349.Material = Enum.Material.Neon
	Part349.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part349.Anchored = true
	Part349.CanCollide = false
	Part349.Size = Vector3.new(0.724486053, 0.0500000007, 0.129599988)
	Part349.CFrame = CFrame.new(17.5807457, 0.422999978, -22.2283401, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part349.BottomSurface = Enum.SurfaceType.Smooth
	Part349.TopSurface = Enum.SurfaceType.Smooth
	Part349.Position = Vector3.new(17.5807457, 0.422999978, -22.2283401)
	Part349.Color = Color3.new(1, 0, 0)
	BlockMesh350.Parent = Part349
	BlockMesh350.Scale = Vector3.new(1, 0.648000002, 1)
	BlockMesh350.Scale = Vector3.new(1, 0.648000002, 1)
	Part351.Parent = Model344
	Part351.Material = Enum.Material.Neon
	Part351.Anchored = true
	Part351.CanCollide = false
	Part351.Size = Vector3.new(0.0500000007, 0.129599988, 3.49919963)
	Part351.CFrame = CFrame.new(17.7478771, 0.422999978, -23.6646061, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part351.BottomSurface = Enum.SurfaceType.Smooth
	Part351.TopSurface = Enum.SurfaceType.Smooth
	Part351.Position = Vector3.new(17.7478771, 0.422999978, -23.6646061)
	Part351.Color = Color3.new(1, 0, 0)
	BlockMesh352.Parent = Part351
	BlockMesh352.Scale = Vector3.new(0.648000002, 1, 1)
	BlockMesh352.Scale = Vector3.new(0.648000002, 1, 1)
	Part353.Parent = Model344
	Part353.Material = Enum.Material.Neon
	Part353.Anchored = true
	Part353.CanCollide = false
	Part353.Size = Vector3.new(0.121499985, 0.0500000007, 3.2480998)
	Part353.CFrame = CFrame.new(17.6385269, 0.422999978, -23.7780075, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part353.BottomSurface = Enum.SurfaceType.Smooth
	Part353.TopSurface = Enum.SurfaceType.Smooth
	Part353.Position = Vector3.new(17.6385269, 0.422999978, -23.7780075)
	Part353.Color = Color3.new(1, 0, 0)
	BlockMesh354.Parent = Part353
	BlockMesh354.Scale = Vector3.new(1, 0.810000062, 1)
	BlockMesh354.Scale = Vector3.new(1, 0.810000062, 1)
	Part355.Parent = Model344
	Part355.Material = Enum.Material.Neon
	Part355.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part355.Anchored = true
	Part355.CanCollide = false
	Part355.Size = Vector3.new(0.108886041, 0.0500000007, 0.0500000007)
	Part355.CFrame = CFrame.new(17.6839848, 0.422999978, -22.1486473, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part355.BottomSurface = Enum.SurfaceType.Smooth
	Part355.TopSurface = Enum.SurfaceType.Smooth
	Part355.Position = Vector3.new(17.6839848, 0.422999978, -22.1486473)
	Part355.Color = Color3.new(1, 0, 0)
	BlockMesh356.Parent = Part355
	BlockMesh356.Scale = Vector3.new(1, 0.972000003, 0.810000062)
	BlockMesh356.Scale = Vector3.new(1, 0.972000003, 0.810000062)
	Model357.Name = "c"
	Model357.Parent = Model0
	Model358.Name = "b"
	Model358.Parent = Model357
	Model359.Name = "b"
	Model359.Parent = Model358
	Part360.Parent = Model359
	Part360.Material = Enum.Material.Neon
	Part360.Anchored = true
	Part360.CanCollide = false
	Part360.Size = Vector3.new(0.109349988, 0.0500000007, 3.79808974)
	Part360.CFrame = CFrame.new(15.8332605, 0.422999978, -16.746666, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part360.BottomSurface = Enum.SurfaceType.Smooth
	Part360.TopSurface = Enum.SurfaceType.Smooth
	Part360.Position = Vector3.new(15.8332605, 0.422999978, -16.746666)
	Part360.Color = Color3.new(1, 0, 0)
	BlockMesh361.Parent = Part360
	BlockMesh361.Scale = Vector3.new(1, 0.729000032, 1)
	BlockMesh361.Scale = Vector3.new(1, 0.729000032, 1)
	Part362.Parent = Model359
	Part362.Material = Enum.Material.Neon
	Part362.Anchored = true
	Part362.CanCollide = false
	Part362.Size = Vector3.new(0.0500000007, 0.116639987, 3.47003961)
	Part362.CFrame = CFrame.new(15.6400757, 0.422999978, -16.9216251, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part362.BottomSurface = Enum.SurfaceType.Smooth
	Part362.TopSurface = Enum.SurfaceType.Smooth
	Part362.Position = Vector3.new(15.6400757, 0.422999978, -16.9216251)
	Part362.Color = Color3.new(1, 0, 0)
	BlockMesh363.Parent = Part362
	BlockMesh363.Scale = Vector3.new(0.58319968, 1, 1)
	BlockMesh363.Scale = Vector3.new(0.58319968, 1, 1)
	Part364.Parent = Model359
	Part364.Material = Enum.Material.Neon
	Part364.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part364.Anchored = true
	Part364.CanCollide = false
	Part364.Size = Vector3.new(0.0979974344, 0.0500000007, 0.0500000007)
	Part364.CFrame = CFrame.new(15.8741741, 0.422999978, -14.842844, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part364.BottomSurface = Enum.SurfaceType.Smooth
	Part364.TopSurface = Enum.SurfaceType.Smooth
	Part364.Position = Vector3.new(15.8741741, 0.422999978, -14.842844)
	Part364.Color = Color3.new(1, 0, 0)
	BlockMesh365.Parent = Part364
	BlockMesh365.Scale = Vector3.new(1, 0.874799907, 0.729000032)
	BlockMesh365.Scale = Vector3.new(1, 0.874799907, 0.729000032)
	Part366.Parent = Model359
	Part366.Material = Enum.Material.Neon
	Part366.Anchored = true
	Part366.CanCollide = false
	Part366.Size = Vector3.new(0.0500000007, 0.116639987, 4.02407932)
	Part366.CFrame = CFrame.new(15.9316759, 0.422999978, -16.6446075, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part366.BottomSurface = Enum.SurfaceType.Smooth
	Part366.TopSurface = Enum.SurfaceType.Smooth
	Part366.Position = Vector3.new(15.9316759, 0.422999978, -16.6446075)
	Part366.Color = Color3.new(1, 0, 0)
	BlockMesh367.Parent = Part366
	BlockMesh367.Scale = Vector3.new(0.583200037, 1, 1)
	BlockMesh367.Scale = Vector3.new(0.583200037, 1, 1)
	Part368.Parent = Model359
	Part368.Material = Enum.Material.Neon
	Part368.Anchored = true
	Part368.CanCollide = false
	Part368.Size = Vector3.new(0.291599959, 0.116639987, 0.0500000007)
	Part368.CFrame = CFrame.new(15.7858763, 0.422999978, -18.642067, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part368.BottomSurface = Enum.SurfaceType.Smooth
	Part368.TopSurface = Enum.SurfaceType.Smooth
	Part368.Position = Vector3.new(15.7858763, 0.422999978, -18.642067)
	Part368.Color = Color3.new(1, 0, 0)
	BlockMesh369.Parent = Part368
	BlockMesh369.Scale = Vector3.new(1, 1, 0.583199978)
	BlockMesh369.Scale = Vector3.new(1, 1, 0.583199978)
	Part370.Parent = Model359
	Part370.Material = Enum.Material.Neon
	Part370.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part370.Anchored = true
	Part370.CanCollide = false
	Part370.Size = Vector3.new(0.652037442, 0.0500000007, 0.116639987)
	Part370.CFrame = CFrame.new(15.7812586, 0.422999978, -14.914567, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part370.BottomSurface = Enum.SurfaceType.Smooth
	Part370.TopSurface = Enum.SurfaceType.Smooth
	Part370.Position = Vector3.new(15.7812586, 0.422999978, -14.914567)
	Part370.Color = Color3.new(1, 0, 0)
	BlockMesh371.Parent = Part370
	BlockMesh371.Scale = Vector3.new(1, 0.583199978, 1)
	BlockMesh371.Scale = Vector3.new(1, 0.583199978, 1)
	Model372.Name = "a"
	Model372.Parent = Model358
	Part373.Parent = Model372
	Part373.Anchored = true
	Part373.CanCollide = false
	Part373.Size = Vector3.new(0.0874799937, 0.0874799937, 4.08239985)
	Part373.CFrame = CFrame.new(15.9316759, 0.422999978, -16.6446075, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part373.BottomSurface = Enum.SurfaceType.Smooth
	Part373.TopSurface = Enum.SurfaceType.Smooth
	Part373.Position = Vector3.new(15.9316759, 0.422999978, -16.6446075)
	Part373.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part374.Parent = Model372
	Part374.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part374.Anchored = true
	Part374.CanCollide = false
	Part374.Size = Vector3.new(0.652037442, 0.0874799937, 0.0874799937)
	Part374.CFrame = CFrame.new(15.7812586, 0.422999978, -14.914567, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part374.BottomSurface = Enum.SurfaceType.Smooth
	Part374.TopSurface = Enum.SurfaceType.Smooth
	Part374.Position = Vector3.new(15.7812586, 0.422999978, -14.914567)
	Part374.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part375.Parent = Model372
	Part375.Anchored = true
	Part375.CanCollide = false
	Part375.Size = Vector3.new(0.0874799863, 0.0874799937, 3.49919963)
	Part375.CFrame = CFrame.new(15.6400757, 0.422999978, -16.9362068, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part375.BottomSurface = Enum.SurfaceType.Smooth
	Part375.TopSurface = Enum.SurfaceType.Smooth
	Part375.Position = Vector3.new(15.6400757, 0.422999978, -16.9362068)
	Part375.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part376.Name = "asd"
	Part376.Parent = Model372
	Part376.Anchored = true
	Part376.CanCollide = false
	Part376.Size = Vector3.new(0.204119995, 0.0874799937, 0.0874799937)
	Part376.CFrame = CFrame.new(15.7858763, 0.422999978, -18.642067, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part376.BottomSurface = Enum.SurfaceType.Smooth
	Part376.TopSurface = Enum.SurfaceType.Smooth
	Part376.Position = Vector3.new(15.7858763, 0.422999978, -18.642067)
	Part376.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Model377.Name = "a"
	Model377.Parent = Model357
	Model378.Name = "a"
	Model378.Parent = Model377
	Part379.Parent = Model378
	Part379.Anchored = true
	Part379.CanCollide = false
	Part379.Size = Vector3.new(0.0874799863, 0.0874799937, 2.6243999)
	Part379.CFrame = CFrame.new(15.6400757, 0.422999978, -23.9562054, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part379.BottomSurface = Enum.SurfaceType.Smooth
	Part379.TopSurface = Enum.SurfaceType.Smooth
	Part379.Position = Vector3.new(15.6400757, 0.422999978, -23.9562054)
	Part379.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part380.Parent = Model378
	Part380.Anchored = true
	Part380.CanCollide = false
	Part380.Size = Vector3.new(0.0874799937, 0.0874799937, 3.20759988)
	Part380.CFrame = CFrame.new(15.9316759, 0.422999978, -23.6646061, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part380.BottomSurface = Enum.SurfaceType.Smooth
	Part380.TopSurface = Enum.SurfaceType.Smooth
	Part380.Position = Vector3.new(15.9316759, 0.422999978, -23.6646061)
	Part380.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part381.Parent = Model378
	Part381.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part381.Anchored = true
	Part381.CanCollide = false
	Part381.Size = Vector3.new(0.652037442, 0.0874799937, 0.0874799937)
	Part381.CFrame = CFrame.new(15.7812586, 0.422999978, -22.3719673, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part381.BottomSurface = Enum.SurfaceType.Smooth
	Part381.TopSurface = Enum.SurfaceType.Smooth
	Part381.Position = Vector3.new(15.7812586, 0.422999978, -22.3719673)
	Part381.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Part382.Name = "asd"
	Part382.Parent = Model378
	Part382.Anchored = true
	Part382.CanCollide = false
	Part382.Size = Vector3.new(0.204119995, 0.0874799937, 0.0874799937)
	Part382.CFrame = CFrame.new(15.7858763, 0.422999978, -25.2246666, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part382.BottomSurface = Enum.SurfaceType.Smooth
	Part382.TopSurface = Enum.SurfaceType.Smooth
	Part382.Position = Vector3.new(15.7858763, 0.422999978, -25.2246666)
	Part382.Color = Color3.new(0.105882, 0.164706, 0.207843)
	Model383.Name = "b"
	Model383.Parent = Model377
	Part384.Parent = Model383
	Part384.Material = Enum.Material.Neon
	Part384.Anchored = true
	Part384.CanCollide = false
	Part384.Size = Vector3.new(0.0500000007, 0.116639987, 2.59523964)
	Part384.CFrame = CFrame.new(15.6400757, 0.422999978, -23.9416256, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part384.BottomSurface = Enum.SurfaceType.Smooth
	Part384.TopSurface = Enum.SurfaceType.Smooth
	Part384.Position = Vector3.new(15.6400757, 0.422999978, -23.9416256)
	Part384.Color = Color3.new(1, 0, 0)
	BlockMesh385.Parent = Part384
	BlockMesh385.Scale = Vector3.new(0.58319968, 1, 1)
	BlockMesh385.Scale = Vector3.new(0.58319968, 1, 1)
	Part386.Parent = Model383
	Part386.Material = Enum.Material.Neon
	Part386.Anchored = true
	Part386.CanCollide = false
	Part386.Size = Vector3.new(0.262439966, 0.116639987, 0.0500000007)
	Part386.CFrame = CFrame.new(15.7858763, 0.422999978, -25.2246666, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part386.BottomSurface = Enum.SurfaceType.Smooth
	Part386.TopSurface = Enum.SurfaceType.Smooth
	Part386.Position = Vector3.new(15.7858763, 0.422999978, -25.2246666)
	Part386.Color = Color3.new(1, 0, 0)
	BlockMesh387.Parent = Part386
	BlockMesh387.Scale = Vector3.new(1, 1, 0.583195448)
	BlockMesh387.Scale = Vector3.new(1, 1, 0.583195448)
	Part388.Parent = Model383
	Part388.Material = Enum.Material.Neon
	Part388.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part388.Anchored = true
	Part388.CanCollide = false
	Part388.Size = Vector3.new(0.652037442, 0.0500000007, 0.116639987)
	Part388.CFrame = CFrame.new(15.7812586, 0.422999978, -22.3719673, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part388.BottomSurface = Enum.SurfaceType.Smooth
	Part388.TopSurface = Enum.SurfaceType.Smooth
	Part388.Position = Vector3.new(15.7812586, 0.422999978, -22.3719673)
	Part388.Color = Color3.new(1, 0, 0)
	BlockMesh389.Parent = Part388
	BlockMesh389.Scale = Vector3.new(1, 0.583199978, 1)
	BlockMesh389.Scale = Vector3.new(1, 0.583199978, 1)
	Part390.Parent = Model383
	Part390.Material = Enum.Material.Neon
	Part390.Anchored = true
	Part390.CanCollide = false
	Part390.Size = Vector3.new(0.0500000007, 0.116639987, 3.14927959)
	Part390.CFrame = CFrame.new(15.9316759, 0.422999978, -23.6646061, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part390.BottomSurface = Enum.SurfaceType.Smooth
	Part390.TopSurface = Enum.SurfaceType.Smooth
	Part390.Position = Vector3.new(15.9316759, 0.422999978, -23.6646061)
	Part390.Color = Color3.new(1, 0, 0)
	BlockMesh391.Parent = Part390
	BlockMesh391.Scale = Vector3.new(0.583200037, 1, 1)
	BlockMesh391.Scale = Vector3.new(0.583200037, 1, 1)
	Part392.Parent = Model383
	Part392.Material = Enum.Material.Neon
	Part392.Anchored = true
	Part392.CanCollide = false
	Part392.Size = Vector3.new(0.109349988, 0.0500000007, 2.92329001)
	Part392.CFrame = CFrame.new(15.8332605, 0.422999978, -23.7666664, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part392.BottomSurface = Enum.SurfaceType.Smooth
	Part392.TopSurface = Enum.SurfaceType.Smooth
	Part392.Position = Vector3.new(15.8332605, 0.422999978, -23.7666664)
	Part392.Color = Color3.new(1, 0, 0)
	BlockMesh393.Parent = Part392
	BlockMesh393.Scale = Vector3.new(1, 0.729000032, 1)
	BlockMesh393.Scale = Vector3.new(1, 0.729000032, 1)
	Part394.Parent = Model383
	Part394.Material = Enum.Material.Neon
	Part394.Rotation = Vector3.new(-90, 0, -63.4300003)
	Part394.Anchored = true
	Part394.CanCollide = false
	Part394.Size = Vector3.new(0.0979974344, 0.0500000007, 0.0500000007)
	Part394.CFrame = CFrame.new(15.8741741, 0.422999978, -22.3002434, 0.44721359, 0.89442718, 0, 0, 0, 1, 0.89442718, -0.44721359, 0)
	Part394.BottomSurface = Enum.SurfaceType.Smooth
	Part394.TopSurface = Enum.SurfaceType.Smooth
	Part394.Position = Vector3.new(15.8741741, 0.422999978, -22.3002434)
	Part394.Color = Color3.new(1, 0, 0)
	BlockMesh395.Parent = Part394
	BlockMesh395.Scale = Vector3.new(1, 0.874799907, 0.729000032)
	BlockMesh395.Scale = Vector3.new(1, 0.874799907, 0.729000032)
	return Model0
end
wing1 = makewing()
wing2 = makewing()


trails = {}
for z = 1, 2 do
	local wong
	if z == 1 then
		wong = wing1
	else
		wong = wing2
	end
	for i, v in pairs(wong:GetChildren()) do
		if v ~= wong.center then
			for i = 1, 2 do
				local shush
				if i == 1 then
					shush = v.a.a.asd
				else
					shush = v.b.a.asd
				end
				local C0 = Instance.new("Attachment", shush)
				local C1 = Instance.new("Attachment", shush)
				if i == 1 then
					C1.Position = Vector3.new(0, 0, 3.7)
				else
					C1.Position = Vector3.new(0, 0, 4.4)
				end
				local trail = Instance.new("Trail", shush)
				trail.Attachment0 = C0
				trail.Attachment1 = C1
				trail.Lifetime = 0.15
				trail.LightEmission = 1
				trail.Transparency = NumberSequence.new(0.1, 1)
				table.insert(trails, trail)
			end
		end
	end
end
local shush = sword.a.HitBox
local C0 = Instance.new("Attachment", shush)
local C1 = Instance.new("Attachment", shush)
C0.Position = Vector3.new(0, -shush.Size.Y / 2, 0)
C1.Position = Vector3.new(0, shush.Size.Y / 2 + 0.4, 0)
local trail = Instance.new("Trail", shush)
trail.Attachment0 = C0
trail.Attachment1 = C1
trail.Lifetime = 0.2
trail.LightEmission = 1
trail.Enabled = false
trail.Transparency = NumberSequence.new(0.1, 1)
table.insert(trails, trail)
function tokkletrail()
	if trail.Enabled then
		trail.Enabled = false
	else
		trail.Enabled = true
	end
end

function toggletrail()
	tokkletrail()
	--remote:FireServer("tokkletrail")
end
weld(wing1.center)
weld(wing1.a.a)
weld(wing1.b.a)
weld(wing1.c.a)
weld(wing1.a.b)
weld(wing1.b.b)
weld(wing1.c.b)
weld(wing2.center)
weld(wing2.a.a)
weld(wing2.b.a)
weld(wing2.c.a)
weld(wing2.a.b)
weld(wing2.b.b)
weld(wing2.c.b)
wingsweld = {
	a = {
		main = newWeld(torso, wing1.center.a.asd, -1.3, 0.7, 0.8),
		a = {
			a = newWeld(wing1.center.a.asd, wing1.a.a.a.asd, 0, 0, 1),
			b = newWeld(wing1.a.a.a.asd, wing1.a.b.a.asd, 0, 0, 4.8)
		},
		b = {
			a = newWeld(wing1.center.a.asd, wing1.b.a.a.asd, 0, 0, 0.8),
			b = newWeld(wing1.b.a.a.asd, wing1.b.b.a.asd, 0, 0, 4.6)
		},
		c = {
			a = newWeld(wing1.center.a.asd, wing1.c.a.a.asd, 0, 0, 0.6),
			b = newWeld(wing1.c.a.a.asd, wing1.c.b.a.asd, 0, 0, 4.4)
		}
	},
	b = {
		main = newWeld(torso, wing2.center.a.asd, 0, 0, 0),
		a = {
			a = newWeld(wing2.center.a.asd, wing2.a.a.a.asd, 0, 0, 0),
			b = newWeld(wing2.a.a.a.asd, wing2.a.b.a.asd, 0, 0, 0)
		},
		b = {
			a = newWeld(wing2.center.a.asd, wing2.b.a.a.asd, 0, 0, 0),
			b = newWeld(wing2.b.a.a.asd, wing2.b.b.a.asd, 0, 0, 0)
		},
		c = {
			a = newWeld(wing2.center.a.asd, wing2.c.a.a.asd, 0, 0, 0),
			b = newWeld(wing2.c.a.a.asd, wing2.c.b.a.asd, 0, 0, 0)
		}
	}
}
wingsweld.a.main.C1 = CFrame.Angles(0, 0, rad(-90)) * CFrame.Angles(0, rad(-90), 0) * CFrame.Angles(0, rad(180), 0)
wingsweld.b.main.C1 = CFrame.Angles(0, 0, rad(-90)) * CFrame.Angles(0, rad(-90), 0)
wingsweld.a.a.a.C1 = CFrame.new(0, 0, -2) * CFrame.Angles(0, rad(-90), 0)
wingsweld.a.b.a.C1 = CFrame.new(0, 0, -2) * CFrame.Angles(0, rad(-90), 0)
wingsweld.a.c.a.C1 = CFrame.new(0, 0, -2) * CFrame.Angles(0, rad(-90), 0)
wingsweld.b.a.a.C1 = CFrame.new(0, 0, -2) * CFrame.Angles(0, rad(-90), 0)
wingsweld.b.b.a.C1 = CFrame.new(0, 0, -2) * CFrame.Angles(0, rad(-90), 0)
wingsweld.b.c.a.C1 = CFrame.new(0, 0, -2) * CFrame.Angles(0, rad(-90), 0)
wingsweld.a.main.C0 = CFrame.new(-1.3, 0.7, 0.9) * CFrame.Angles(0, rad(10), rad(50))
wingsweld.b.main.C0 = CFrame.new(1.3, 0.7, 0.9) * CFrame.Angles(0, rad(-10), rad(-50))
wingsweld.a.a.a.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(80), 0)
wingsweld.a.b.a.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(60), 0)
wingsweld.a.c.a.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(40), 0)
wingsweld.b.a.a.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(80), 0)
wingsweld.b.b.a.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(60), 0)
wingsweld.b.c.a.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, rad(40), 0)
wingsweld.a.a.b.C0 = CFrame.new(0, 0, 4.5) * CFrame.Angles(0, rad(-80), 0)
wingsweld.a.b.b.C0 = CFrame.new(0, 0, 4.25) * CFrame.Angles(0, rad(-60), 0)
wingsweld.a.c.b.C0 = CFrame.new(0, 0, 4) * CFrame.Angles(0, rad(-40), 0)
wingsweld.b.a.b.C0 = CFrame.new(0, 0, 4.5) * CFrame.Angles(0, rad(-80), 0)
wingsweld.b.b.b.C0 = CFrame.new(0, 0, 4.25) * CFrame.Angles(0, rad(-60), 0)
wingsweld.b.c.b.C0 = CFrame.new(0, 0, 4) * CFrame.Angles(0, rad(-40), 0)


-- START WING REP
CountSCIFIMOVIELOL = 1
function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
	if Part0:FindFirstChildWhichIsA("SpecialMesh") ~= nil then
		Part0:FindFirstChildWhichIsA("SpecialMesh"):Destroy()
	end
	local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 67752;
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "AthP_"..CountSCIFIMOVIELOL
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "AthP_"..CountSCIFIMOVIELOL
	local AttachmentC=Instance.new('Attachment',Part1); AttachmentC.Name = "AthO_"..CountSCIFIMOVIELOL
	local AttachmentD=Instance.new('Attachment',Part0); AttachmentD.Name = "AthO_"..CountSCIFIMOVIELOL
	AttachmentC.Orientation = Angle
	AttachmentA.Position = Position
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentC;
	AlignOri.Attachment0 = AttachmentD;
	CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1

	s = game:GetService("RunService").Heartbeat:connect(function()
		Part0.Velocity = Vector3.new(0,35,0)
	end)
	spawn(function()
		while true do
			wait()
			if HumanDied then
				s:Disconnect()
				break
			end
		end
	end)
end



if #REPWINGS > 1 then
	REPWINGS[1].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[1],wing1.a.a.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))

	REPWINGS[2].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[2],wing1.a.b.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))


	REPWINGS[3].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[3],wing1.b.a.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))

	REPWINGS[4].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[4],wing1.b.b.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))

	REPWINGS[5].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[5],wing1.c.a.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))

	REPWINGS[6].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[6],wing1.c.b.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))

	--- Wing2

	REPWINGS[7].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[7],wing2.a.a.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))

	REPWINGS[8].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[8],wing2.a.b.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))


	REPWINGS[9].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[9],wing2.b.a.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))

	REPWINGS[10].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[10],wing2.b.b.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))

	REPWINGS[11].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[11],wing2.c.a.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))

	REPWINGS[12].Parent = game.Players.LocalPlayer.Character
	SCIFIMOVIELOL(REPWINGS[6],wing2.c.b.a.asd,Vector3.new(0,0,3.96/2),Vector3.new(0,0,0))

else

end




















modeslist = {
	"Illumination",
	"SpaceDistortion",
	"DripOverdrive",
	"Skylight",
	"NUCLEARSTAR",
	"BackBeat",
	"ExceededFrostBite",
	"Visualizer"
}
currentmodenumber = nil
currentmode = nil
local modesettings = {
	Illumination = {
		colora = Color3.new(1, 1, 1),
		colorb = Color3.fromRGB(127, 255, 0),
		colorc = Color3.fromHSV(0, 0, 0.8),
		materiala = Enum.Material.SmoothPlastic,
		materialb = Enum.Material.Neon,
		music = 1538860798
	},
	SpaceDistortion = {
		colora = Color3.fromHSV(0.5, 0.5, 0.2),
		colorb = Color3.fromHSV(0.5, 1, 1),
		colorc = Color3.fromHSV(0, 0, 0.5),
		materiala = Enum.Material.SmoothPlastic,
		materialb = Enum.Material.Neon,
		music = 1751171913
	},
	DripOverdrive = {
		colora = Color3.fromRGB(20, 20, 157),
		colorb = Color3.fromHSV(0.45, 1, 1),
		colorc = Color3.fromRGB(40, 40, 105),
		materiala = Enum.Material.Ice,
		materialb = Enum.Material.Neon,
		music = 1273947167
	},
	Skylight = {
		colora = Color3.fromRGB(0, 0, 90),
		colorb = Color3.new(1, 1, 0),
		colorc = Color3.fromRGB(40, 40, 80),
		materiala = Enum.Material.SmoothPlastic,
		materialb = Enum.Material.Neon,
		music = 2030487080
	},
	NUCLEARSTAR = {
		colora = Color3.fromHSV(0.71, 1, 1),
		colorb = Color3.fromHSV(0.8, 1, 1),
		colorc = Color3.fromHSV(0.78, 1, 0.8),
		materiala = Enum.Material.SmoothPlastic,
		materialb = Enum.Material.Neon,
		music = 2322714790
	},
	BackBeat = {
		colora = Color3.fromHSV(0, 0, 0),
		colorb = Color3.fromHSV(1, 1, 1),
		colorc = Color3.fromHSV(0, 0, 0.1),
		materiala = Enum.Material.SmoothPlastic,
		materialb = Enum.Material.Neon,
		music = 780257650
	},
	ExceededFrostBite = {
		colora = Color3.fromRGB(130, 200, 255),
		colorb = Color3.fromHSV(0.52, 0.2, 1),
		colorc = Color3.fromRGB(180, 200, 255),
		materiala = Enum.Material.Ice,
		materialb = Enum.Material.Neon,
		music = 1327427310
	},
	Visualizer = {
		colora = Color3.fromRGB(80, 80, 80),
		colorb = Color3.fromHSV(0, 0, 1),
		colorc = Color3.fromRGB(80, 80, 80),
		materiala = Enum.Material.SmoothPlastic,
		materialb = Enum.Material.Neon,
		music = "Stop"
	}
}
function addblood(target)
	for i = 1, 10 do
		Effect(Enum.MeshType.Sphere, Vector3.new(0.5, 1, 0.5) * 5, 0, Enum.Material.Neon, modesettings[currentmode].colorb, target:FindFirstChild("HumanoidRootPart").Position, Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360)), Vector3.new(math.random(-200, 200), math.random(-200, 200), math.random(-200, 200)) / 2000, Vector3.new(-1, -1, -1) * 0.1, Vector3.new(math.random(-200, 200), math.random(-200, 200), math.random(-200, 200)) / 20, 0, 0)
	end
	if target:FindFirstChild("Torso") then
		sound(206082273, target.Torso.Position, 10)
	elseif target:FindFirstChild("UpperTorso") then
		sound(206082273, target.UpperTorso.Position, 10)
	end
end

local tppositions = {}
function changemodo(mode)
	if modeslist[mode] ~= currentmode then
		if plr == lplr then
			for i = 1, #tppositions do
				tppositions[i]:Destroy()
			end
			tppositions = {}
			shake(40)
			sound(153832545, root.Position, 3, 0.85)
			sound(1843023382, root.Position, 10, 1)
			sound(1843194183, root.Position, 10, 1, 0.6)
			for i = 1, 60 do
				local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
				local asd2 = Vector3.new(math.random(-10000, 10000) / 10000, 0, math.random(-10000, 10000) / 10000)
				Effect(Enum.MeshType.Wedge, Vector3.new(0, 10, 10), 0, Enum.Material.Neon, modesettings[modeslist[mode]].colorb, root.Position + asd * 3, asd * 360, root.Velocity / 110 + asd * 2, Vector3.new(0, 0, 0), asd * 5, 0.005, 0)
				Effect(Enum.MeshType.Wedge, Vector3.new(0, 10, 10), 0, Enum.Material.Neon, modesettings[modeslist[mode]].colorb, root.Position + asd * 3, asd * 360, root.Velocity / 110 + asd * 4, Vector3.new(0, 0, 0), asd * 5, 0.005, 0)
			end
			Effect(Enum.MeshType.Sphere, Vector3.new(5, 5, 5), 0, Enum.Material.Neon, modesettings[modeslist[mode]].colorb, torso.Position, Vector3.new(), Vector3.new(), Vector3.new(2, 2, 2), Vector3.new(), 0.02, -0.05)
			Effect(Enum.MeshType.Sphere, Vector3.new(5, 5, 5), 0, Enum.Material.Neon, modesettings[modeslist[mode]].colorb, torso.Position, Vector3.new(), Vector3.new(), Vector3.new(5, 5, 5), Vector3.new(), 0.02, -0.05)
			Effect(Enum.MeshType.Sphere, Vector3.new(5, 5, 5), 0.5, Enum.Material.Neon, modesettings[modeslist[mode]].colorb, torso.Position, Vector3.new(), Vector3.new(), Vector3.new(5, 5, 5) * 2, Vector3.new(), 0.005, -0.01)
			if jumped == false then
				Effect(559831844, Vector3.new(0.2, 0.2, 0), 0, Enum.Material.Neon, modesettings[modeslist[mode]].colora, torso.Position + Vector3.new(0, -1, 0), Vector3.new(90, 0, 0), Vector3.new(), Vector3.new(2, 2, 2), Vector3.new(), 0.04, 0)
				Effect(559831844, Vector3.new(0.2, 0.2, 0), 0, Enum.Material.Neon, modesettings[modeslist[mode]].colora, torso.Position + Vector3.new(0, -1, 0), Vector3.new(90, 0, 0), Vector3.new(0, 4, 0), Vector3.new(2, 2, 2), Vector3.new(), 0.04, -0.04)
			end
		end
		for i = 1, 2 do
			local wong
			if i == 1 then
				wong = wing1
			else
				wong = wing2
			end
			partchange(wong.center.a, modesettings[modeslist[mode]].materiala, modesettings[modeslist[mode]].colora)
			partchange(wong.a.a.a, modesettings[modeslist[mode]].materiala, modesettings[modeslist[mode]].colora)
			partchange(wong.a.b.a, modesettings[modeslist[mode]].materiala, modesettings[modeslist[mode]].colora)
			partchange(wong.b.a.a, modesettings[modeslist[mode]].materiala, modesettings[modeslist[mode]].colora)
			partchange(wong.b.b.a, modesettings[modeslist[mode]].materiala, modesettings[modeslist[mode]].colora)
			partchange(wong.c.a.a, modesettings[modeslist[mode]].materiala, modesettings[modeslist[mode]].colora)
			partchange(wong.c.b.a, modesettings[modeslist[mode]].materiala, modesettings[modeslist[mode]].colora)
			partchange(wong.center.b, modesettings[modeslist[mode]].materialb, modesettings[modeslist[mode]].colorb)
			partchange(wong.a.a.b, modesettings[modeslist[mode]].materialb, modesettings[modeslist[mode]].colorb)
			partchange(wong.a.b.b, modesettings[modeslist[mode]].materialb, modesettings[modeslist[mode]].colorb)
			partchange(wong.b.a.b, modesettings[modeslist[mode]].materialb, modesettings[modeslist[mode]].colorb)
			partchange(wong.b.b.b, modesettings[modeslist[mode]].materialb, modesettings[modeslist[mode]].colorb)
			partchange(wong.c.a.b, modesettings[modeslist[mode]].materialb, modesettings[modeslist[mode]].colorb)
			partchange(wong.c.b.b, modesettings[modeslist[mode]].materialb, modesettings[modeslist[mode]].colorb)
		end
		partchange(sword.a, modesettings[modeslist[mode]].materiala, modesettings[modeslist[mode]].colora)
		partchange(sword.b, modesettings[modeslist[mode]].materialb, modesettings[modeslist[mode]].colorb)
		partchange(sword.c, Enum.Material.SmoothPlastic, modesettings[modeslist[mode]].colorc)
		partchange(headphone.a, modesettings[modeslist[mode]].materiala, modesettings[modeslist[mode]].colora)
		partchange(headphone.b, modesettings[modeslist[mode]].materialb, modesettings[modeslist[mode]].colorb)
		for i, v in pairs(trails) do
			v.Color = ColorSequence.new(modesettings[modeslist[mode]].colorb)
		end
		music(modesettings[modeslist[mode]].music)
		currentmode = modeslist[mode]
		currentmodenumber = mode
	end
end

function changemode(mode)
	changemodo(mode)
	--remote:FireServer("changemodo", mode)
end
if plr == lplr then
	GUI = Instance.new("ScreenGui", p.PlayerGui)
	GUI.Name = "BlackHoleKyu"
	textlabel = Instance.new("TextLabel", GUI)
	textlabel.AnchorPoint = Vector2.new(1, 1)
	textlabel.Position = UDim2.new(1, 505, 1, -5)
	textlabel.Size = UDim2.new(0, 500, 0, 400)
	textlabel.BorderSizePixel = 5
	textlabel.BorderColor3 = bordercolortitle
	textlabel.BackgroundColor3 = backgroundcolortitle
	textlabel.BackgroundTransparency = 0.1
	textlabel.TextTransparency = 0.1
	textlabel.TextColor3 = Color3.fromHSV(0, 0, 1)
	textlabel.TextScaled = true
	textlabel.TextYAlignment = Enum.TextYAlignment.Center
	textlabel.Font = Enum.Font.SciFi
	textlabel.Text = title
end
if plr == lplr then
	ScreenGui0 = GUI
	ImageLabeleffect = Instance.new("ImageLabel", ScreenGui0)
	ImageLabeleffect.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabeleffect.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabeleffect.Size = UDim2.new(1, 0, 1, 0)
	ImageLabeleffect.Image = "rbxassetid://190596490"
	ImageLabeleffect.BackgroundTransparency = 1
	ImageLabeleffect.ImageTransparency = 0.9
	for i = 1, #modeslist do
		do
			local Frame1 = Instance.new("Frame")
			local TextButton2 = Instance.new("TextButton")
			local Frame3 = Instance.new("Frame")
			Frame1.Name = i
			Frame1.Parent = ScreenGui0
			Frame1.Transparency = 1
			Frame1.Size = UDim2.new(0, 0, 0, 0)
			Frame1.Position = UDim2.new(0.5, 0, 0.5, 0)
			Frame1.BackgroundColor3 = Color3.new(1, 1, 1)
			Frame1.BackgroundTransparency = 1
			Frame1.AnchorPoint = Vector2.new(0.5, 0.5)
			local e = (i - 1) * (180 / (#modeslist - 1))
			Frame1.Rotation = e
			Frame3.BorderSizePixel = 2
			Frame3.Parent = Frame1
			Frame3.BackgroundColor3 = modesettings[modeslist[i]].colora
			Frame3.BorderColor3 = modesettings[modeslist[i]].colorb
			Frame3.BackgroundTransparency = 0.1
			Frame3.Position = UDim2.new(0.5, 0, 0.5, 0)
			Frame3.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame3.Size = UDim2.new(0, 0, 0, 0)
			TextButton2.Text = modeslist[i]
			TextButton2.Parent = Frame3
			TextButton2.Size = UDim2.new(1, 0, 1, 0)
			TextButton2.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextButton2.Font = Enum.Font.SciFi
			TextButton2.FontSize = Enum.FontSize.Size14
			TextButton2.TextColor3 = Color3.new(1, 1, 1)
			TextButton2.AnchorPoint = Vector2.new(0.5, 0.5)
			TextButton2.TextScaled = true
			TextButton2.TextColor3 = modesettings[modeslist[i]].colorb
			TextButton2.TextTransparency = 0.1
			TextButton2.BackgroundTransparency = 1
			Frame3.Visible = false
			TextButton2.MouseButton1Click:connect(function()
				coroutine.resume(coroutine.create(function()
					local e = Frame3:Clone()
					e:ClearAllChildren()
					e.Parent = Frame3
					e.Size = UDim2.new(1, 0, 1, 0)
					e.Position = UDim2.new(0.5, 0, 0.5, 0)
					e.Rotation = 0
					repeat
						rs:wait()
						e.Size = e.Size + UDim2.new(0, 10, 0, 10)
						e.BackgroundTransparency = e.BackgroundTransparency + 0.05
					until 1 <= e.BackgroundTransparency
					e:Destroy()
				end))
				changemode(i)
			end)
			coroutine.resume(coroutine.create(function()
				local wat = i * 10
				Frame3.Rotation = wat
				while rs:wait() do
					Frame3.Rotation = Frame3.Rotation + 2
					TextButton2.Rotation = -e - Frame3.Rotation
				end
			end))
		end
	end
end
local guidebouncekek = false
local guiopened = false
mouse.KeyDown:connect(function(key)
	if plr == lplr and key == "y" and guidebouncekek == false then
		guidebouncekek = true
		if guiopened == true then
			for i = 1, #modeslist do
				ScreenGui0:FindFirstChild(i).Frame:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5)
				ScreenGui0:FindFirstChild(i).Frame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5)
			end
			guiopened = false
			wait(0.5)
			for i = 1, #modeslist do
				ScreenGui0:FindFirstChild(i).Frame.Visible = false
			end
		else
			for i = 1, #modeslist do
				ScreenGui0:FindFirstChild(i).Frame.Visible = true
				ScreenGui0:FindFirstChild(i).Frame:TweenPosition(UDim2.new(0.5, -300, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5)
				ScreenGui0:FindFirstChild(i).Frame:TweenSize(UDim2.new(0, 100, 0, 100), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5)
			end
			guiopened = true
			wait(0.5)
		end
		guidebouncekek = false
	end
end)
guiopen = false
debouncebutton = false
function openhelp()
	if debouncebutton == false then
		if guiopen == false then
			debouncebutton = true
			textlabel:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.2)
			guiopen = true
			wait(0.2)
		else
			debouncebutton = true
			textlabel:TweenPosition(UDim2.new(1, 505, 1, -5), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.2)
			guiopen = false
			wait(0.2)
		end
	end
	debouncebutton = false
end
if plr == lplr then
	openhelp()
end
mouse.KeyDown:connect(function(key)
	if plr == lplr and key == "h" then
		openhelp()
	end
end)
local alreadytouched = {}
hitsounds = {
	344936319,
	154965973,
	344936310,
	344936315
}
function checkattack()
	for i, v in pairs(findAllNearestTorso(sword.a.HitBox.Position, 4)) do
		local hit = v.Parent
		local hurt = true
		for i, v in pairs(alreadytouched) do
			if v == hit then
				hurt = false
			end
		end
		if hurt then
			table.insert(alreadytouched, hit)
			if hit:FindFirstChildOfClass("Humanoid") then
				local hum = hit:FindFirstChildOfClass("Humanoid")
				if hum.MaxHealth > 1.0E100 then
					--remote:FireServer("breakjoints", v.Parent)
				else
					--remote:FireServer("damage", hum, hum.MaxHealth / math.random(5, 6) * (size / 2))
				end
				sound(hitsounds[math.random(1, #hitsounds)], sword.a.HitBox.Position, 10, math.random(9, 11) / 10)
			end
		end
	end
end
function attackone()
	local spd = 0.4
	for i = 1, 5 do
		rs:wait()
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(rad(0), rad(30), rad(0)), spd)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55, 0) * CFrame.Angles(rad(90), rad(-40), rad(50)), spd)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55, 0) * CFrame.Angles(rad(100), rad(80), rad(0)), spd)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(rad(0), rad(40), rad(0)), spd)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(-40), rad(0)), spd)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(-40), rad(0)), spd)
	end
	sound(978101945, root.Position, 10, math.random(9, 11) / 10)
	local spd = 0.8
	for i = 1, 2 do
		rs:wait()
		checkattack()
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(rad(0), rad(-10), rad(0)), spd)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55, 0) * CFrame.Angles(rad(-20), rad(0), rad(-20)), spd)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55, 0) * CFrame.Angles(rad(-60), rad(-50), rad(0)), spd)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(rad(0), rad(-10), rad(5)), spd)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(10), rad(-5)), spd)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
	end
end
function attacktwo()
	local spd = 0.4
	for i = 1, 5 do
		rs:wait()
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(rad(0), rad(-40), rad(0)), spd)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55, 0) * CFrame.Angles(rad(40), rad(0), rad(-40)), spd)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55, 0) * CFrame.Angles(rad(100), rad(-40), rad(0)), spd)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(rad(0), rad(-40), rad(0)), spd)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(40), rad(0)), spd)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(40), rad(0)), spd)
	end
	sound(978101945, root.Position, 10, math.random(9, 11) / 10)
	local spd = 0.8
	for i = 1, 2 do
		rs:wait()
		checkattack()
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(rad(0), rad(70), rad(0)), spd)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55, 0) * CFrame.Angles(rad(-40), rad(0), rad(20)), spd)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55, 0) * CFrame.Angles(rad(10), rad(-40), rad(-40)), spd)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(rad(0), rad(80), rad(-10)), spd)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(-80), rad(10)), spd)
	end
end
function attackthree()
	local spd = 0.4
	for i = 1, 5 do
		rs:wait()
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(rad(0), rad(40), rad(0)), spd)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55, 0) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55, 0) * CFrame.Angles(rad(150), rad(20), rad(40)), spd)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(rad(0), rad(40), rad(0)), spd)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(-40), rad(0)), spd)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(-40), rad(0)), spd)
	end
	sound(821439273, root.Position, 10, math.random(20, 21) / 10)
	sound(978101945, root.Position, 10, math.random(7, 9) / 10)
	projectile(root.Position, root.Position + root.CFrame.lookVector * 20 + Vector3.new(0, -1, 0), 3, 200, modesettings[currentmode].colorb, function(pos, color, speed, size)
		Effect(Enum.MeshType.Brick, Vector3.new(1.5, 1.5, 1.5) * size, 0, Enum.Material.Neon, color, pos, Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360)), Vector3.new(math.random(-20, 20) / 10, math.random(-20, 20) / 10, math.random(-20, 20) / 10) * (speed / 200) / 2, Vector3.new(-0.2, -0.2, -0.2) * (size / 2), Vector3.new(math.random(-20, 20) / 10, math.random(-20, 20) / 10, math.random(-20, 20) / 10), 0, 0)
	end, function(pos, color, speed, size)
		for i = 1, 15 do
			Effect(Enum.MeshType.Brick, Vector3.new(2.5, 2.5, 2.5) * size, 0, Enum.Material.Neon, color, pos, Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360)), Vector3.new(math.random(-20, 20) / 10, math.random(-20, 20) / 10, math.random(-20, 20) / 10) * (size / 2), Vector3.new(-0.2, -0.2, -0.2), Vector3.new(math.random(-20, 20) / 10, math.random(-20, 20) / 10, math.random(-20, 20) / 10), 0, 0)
		end
		Effect(Enum.MeshType.Sphere, Vector3.new(2, 2, 2) * size, 0, Enum.Material.Neon, color, pos, Vector3.new(), Vector3.new(), Vector3.new(0.2, 0.2, 0.2) * (size * 2), Vector3.new(), 0.04, 0.1)
		sound(262562442, pos, 10, math.random(90, 170) / 100)
	end)
	local spd = 0.8
	for i = 1, 5 do
		rs:wait()
		checkattack()
		hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
		hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(rad(0), rad(40), rad(0)), spd)
		larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55, 0) * CFrame.Angles(rad(-10), rad(0), rad(-40)), spd)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55, 0) * CFrame.Angles(rad(-30), rad(-50), rad(0)), spd)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(rad(-10), rad(50), rad(-10)), spd)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.95, 0) * CFrame.Angles(rad(-10), rad(0), rad(0)), spd)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(-50), rad(10)), spd)
	end
end
local combo = 1
local combo2 = 2
local timer = 0
mouse.Button1Down:connect(function()
	if debounce == false and plr == lplr then
		alreadytouched = {}
		timer = 40
		noidle = true
		debounce = true
		animsync = true
		toggletrail()
		if combo == 1 then
			if combo2 == 1 then
				attackone()
			else
				attacktwo()
			end
			combo = 2
			animsync = false
		elseif combo == 2 then
			if combo2 == 2 then
				attackone()
			else
				attacktwo()
			end
			combo = 3
			animsync = false
		elseif combo == 3 then
			if combo2 == 1 then
				combo2 = 2
			else
				combo2 = 1
			end
			attackthree()
			combo = 1
			animsync = false
		end
		toggletrail()
		noidle = false
		delay(0.1, function()
			debounce = false
		end)
	end
end)
mouse.Button1Down:connect(function()
	if plr == lplr and debounce == false then
		debounce = true
		debounce = false
	end
end)
mouse.KeyDown:connect(function(key)
	if plr == lplr then
		if key == "e" and debounce == false then
			debounce = true
			noidle = true
			sound(1202656211, root.Position, 10, math.random(300, 350) / 100)
			local tempattach = Instance.new("Attachment", root)
			tempattach.Position = Vector3.new(0, 0, -40)
			for i = 1, 10 do
				rs:wait()
				local temppos = root.Position
				root.CFrame = CFrame.new(tempattach.WorldPosition) * CFrame.Angles(0, rad(root.Orientation.Y), 0)
				root.Velocity = Vector3.new()
				for i = 1, 3 do
					Effect(Enum.MeshType.Wedge, Vector3.new(0, 1, 1) * 10, 0, Enum.Material.Neon, modesettings[currentmode].colorb, root.Position + Vector3.new(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360)) / 360, Vector3.new(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360)), Vector3.new(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360)) / 90, Vector3.new(0, 1, 1) * -0.25, Vector3.new(), 0, 0)
				end
				woosh = true
				hed.Weld.C0 = CFrame.new(0, 1.5, -0.1) * CFrame.Angles(0, 0, 0)
				hed.Weld.C1 = CFrame.Angles(rad(-20), 0, 0)
				larm.Weld.C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(rad(-40), rad(0), rad(-5))
				rarm.Weld.C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(rad(-40), rad(0), rad(5))
				torso.Weld.C0 = CFrame.new(0, -0.5, 0) * CFrame.Angles(rad(-40), rad(0), rad(0))
				lleg.Weld.C0 = CFrame.new(-0.5, -0.6, -1) * CFrame.Angles(rad(-70), rad(0), rad(-1))
				rleg.Weld.C0 = CFrame.new(0.5, -0.95, 0) * CFrame.Angles(rad(-30), rad(0), rad(1))
			end
			noidle = false
			debounce = false
		end
		if key == "q" and debounce == false then
			debounce = true
			sound(1202656211, root.Position, 10, math.random(300, 350) / 100)
			local tempattach = Instance.new("Attachment", root)
			tempattach.Position = Vector3.new(0, 40, 0)
			for i = 1, 10 do
				rs:wait()
				local temppos = root.Position
				root.CFrame = CFrame.new(tempattach.WorldPosition) * CFrame.Angles(0, rad(root.Orientation.Y), 0)
				root.Velocity = Vector3.new()
				for i = 1, 3 do
					Effect(Enum.MeshType.Wedge, Vector3.new(0, 1, 1) * 10, 0, Enum.Material.Neon, modesettings[currentmode].colorb, root.Position + Vector3.new(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360)) / 360, Vector3.new(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360)), Vector3.new(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360)) / 90, Vector3.new(0, 1, 1) * -0.25, Vector3.new(), 0, 0)
				end
				woosh = true
			end
			debounce = false
		end
	end
end)
mouse.KeyDown:connect(function(key)
	if plr == lplr then
		if key == "r" and debounce == false and currentmode == modeslist[2] then
			if (mouse.Hit.p - root.Position).magnitude <= 100 and #tppositions <= 20 then
				local e = sond(578970639, root.Position, 10, 3)
				e.Parent = char
				local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
				Effect(Enum.MeshType.Sphere, Vector3.new(1, 1, 1), 0, Enum.Material.Neon, modesettings[currentmode].colorb, mouse.Hit.p, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) / 2, Vector3.new(), 0.25, -0.025)
				local part = Instance.new("Part", DebrisModel)
				part.Name = "tppos"
				part.CFrame = mouse.Hit
				part.Anchored = true
				part.CanCollide = false
				part.Size = Vector3.new(1, 1, 1) / 1.5
				part.Material = Enum.Material.Neon
				part.Color = modesettings[currentmode].colorb
				local mesh = Instance.new("SpecialMesh", part)
				mesh.MeshType = Enum.MeshType.Sphere
				tppositions[#tppositions + 1] = part
			else
				local e = sond(184734960, root.Position, 10, 1.5)
				e.Parent = char
			end
		end
		if key == "f" and debounce == false and currentmode == modeslist[2] then
			debounce = true
			animsync = true
			noidle = true
			if #tppositions == 0 then
				local e = sond(184734960, root.Position, 10, 1.5)
				e.Parent = char
			end
			for i = 1, #tppositions do
				rs:wait()
				rs:wait()
				rs:wait()
				root.CFrame = CFrame.new(root.Position, tppositions[i].Position)
				local pos = root.Position
				local tppos = Instance.new("Attachment", root)
				tppos.Position = Vector3.new(0, 0, -(root.Position - tppositions[i].Position).magnitude / 5)
				local temp_alreadytouched = {}
				sound(1202656211, root.Position, 10, math.random(300, 350) / 100)
				sound(695389867, tppositions[i].Position, 10, 2)
				hed.Weld.C0 = CFrame.new(0, 1.5, -0.2) * CFrame.Angles(rad(-18), rad(0 + rad(0 + 2 * math.cos(sine / 2))), 0)
				hed.Weld.C1 = CFrame.Angles(rad(-30), rad(0), 0)
				larm.Weld.C0 = CFrame.new(-0.8, 0.55 - 0.1 * math.cos(sine / 16) / 2, -0.1 * math.cos(sine / 16)) * CFrame.Angles(rad(115), rad(0 - 1 * math.cos(sine / 16)), rad(30 - 1 * math.cos(sine / 8)))
				rarm.Weld.C0 = CFrame.new(1.5, 0.55 - 0.1 * math.cos(sine / 16) / 2, -0.1 * math.cos(sine / 16)) * CFrame.Angles(rad(0), rad(80 - 1 * math.cos(sine / 16)), rad(60 + 1 * math.cos(sine / 8)))
				torso.Weld.C0 = CFrame.new(0, -1.5 - 0.1 * math.cos(sine / 16), 0) * CFrame.Angles(rad(-45 - 2 * math.cos(sine / 16)), rad(0), rad(0 - 1 * math.cos(sine / 32)))
				lleg.Weld.C0 = CFrame.new(-0.5, -0.95 + 0.1 * math.cos(sine / 16), 0) * CFrame.Angles(rad(-10 - 1 * math.cos(sine / 16)), rad(0 - 1 * math.cos(sine / 16)), rad(-2 - 0.5 * math.cos(sine / 8)))
				rleg.Weld.C0 = CFrame.new(0.5, 0.1 * math.cos(sine / 16), -0.5) * CFrame.Angles(rad(50 + 1 * math.cos(sine / 16)), rad(0 - 1 * math.cos(sine / 16)), rad(2 + 0.5 * math.cos(sine / 8)))
				for i = 1, 5 do
					for i, z in pairs(findAllNearestTorso(root.Position, 15)) do
						local hit = z.Parent
						local hurt = true
						for i, v in pairs(temp_alreadytouched) do
							if v == hit then
								hurt = false
							end
						end
						if hurt == true then
							table.insert(temp_alreadytouched, hit)
							if hit:FindFirstChildOfClass("Humanoid").MaxHealth >= 1.0E100 then
								--remote:FireServer("breakjoints")
								if 0 < hit:FindFirstChildOfClass("Humanoid").Health then
								end
							else
								--remote:FireServer("damage", hit:FindFirstChildOfClass("Humanoid"), hit:FindFirstChildOfClass("Humanoid").MaxHealth / 10)
							end
							sound(hitsounds[math.random(1, #hitsounds)], z.Position, 10, math.random(9, 11) / 10)
							if 0 >= hit:FindFirstChildOfClass("Humanoid").Health then
								--remote:FireServer("breakjoints")
								if 0 < hit:FindFirstChildOfClass("Humanoid").Health then
								end
							end
						end
					end
					root.CFrame = CFrame.new(tppos.WorldPosition) * CFrame.Angles(0, rad(root.Orientation.Y), 0)
				end
				tppositions[i]:Destroy()
				tppos:Destroy()
				for i = 1, 5 do
					Lightning(pos, root.Position, math.random(4, 6), 2, modesettings[currentmode].colorb, 0.5, 0.56)
				end
				for i = 1, 10 do
					hed.Weld.C0 = CFrame.new(0, 1.5, -0.2) * CFrame.Angles(rad(-18), rad(0 + rad(0 + 2 * math.cos(sine / 2))), 0)
					hed.Weld.C1 = CFrame.Angles(rad(-30), rad(0), 0)
					larm.Weld.C0 = CFrame.new(-0.8, 0.55 - 0.1 * math.cos(sine / 16) / 2, -0.1 * math.cos(sine / 16)) * CFrame.Angles(rad(115), rad(0 - 1 * math.cos(sine / 16)), rad(30 - 1 * math.cos(sine / 8)))
					rarm.Weld.C0 = CFrame.new(1.5, 0.55 - 0.1 * math.cos(sine / 16) / 2, -0.1 * math.cos(sine / 16)) * CFrame.Angles(rad(0), rad(-80 - 1 * math.cos(sine / 16)), rad(60 + 1 * math.cos(sine / 8)))
					torso.Weld.C0 = CFrame.new(0, -1.5 - 0.1 * math.cos(sine / 16), 0) * CFrame.Angles(rad(-45 - 2 * math.cos(sine / 16)), rad(0), rad(0 - 1 * math.cos(sine / 32)))
					lleg.Weld.C0 = CFrame.new(-0.5, -0.95 + 0.1 * math.cos(sine / 16), 0) * CFrame.Angles(rad(-30 - 1 * math.cos(sine / 16)), rad(0 - 1 * math.cos(sine / 16)), rad(-2 - 0.5 * math.cos(sine / 8)))
					rleg.Weld.C0 = CFrame.new(0.5, 0.1 * math.cos(sine / 16), -0.5) * CFrame.Angles(rad(50 + 1 * math.cos(sine / 16)), rad(0 - 1 * math.cos(sine / 16)), rad(2 + 0.5 * math.cos(sine / 8)))
				end
			end
			tppositions = {}
			debounce = false
			animsync = false
			noidle = false
		end
	end
end)
mouse.KeyDown:connect(function(key)
	if plr == lplr and key == "r" and currentmode == modeslist[1] then
		do
			local up = false
			mouse.KeyUp:connect(function(key)
				if key == "r" then
					up = true
				end
			end)
			repeat
				rs:wait()
				local Position = Vector3.new(math.ceil(root.Position.X), math.ceil(root.Position.Y), math.ceil(root.Position.Z))
				local Target = mouse.Hit.p
				local ray = Ray.new(Position, (Target - Position).unit * 50)
				local part, endPoint = workspace:FindPartOnRay(ray, char)
				Effect(Enum.MeshType.Brick, Vector3.new(15, 15, 15), 0, Enum.Material.Neon, modesettings[currentmode].colorb, endPoint, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) * -0.5, Vector3.new(), 0, -0.05)
			until up == true
			local Position = Vector3.new(math.ceil(root.Position.X), math.ceil(root.Position.Y), math.ceil(root.Position.Z))
			local Target = mouse.Hit.p
			local ray = Ray.new(Position, (Target - Position).unit * 50)
			local part, endPoint = workspace:FindPartOnRay(ray, char)
			Effect(Enum.MeshType.Sphere, Vector3.new(10, 10, 10), 0, Enum.Material.Neon, modesettings[currentmode].colorb, endPoint, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) * 2, Vector3.new(), 0.05, -0.05)
			local e = Effect(Enum.MeshType.Brick, Vector3.new(10, 10, 10), -50, Enum.Material.Neon, modesettings[currentmode].colorb, endPoint, Vector3.new(), Vector3.new(), Vector3.new(), Vector3.new(), 0.1, 0)
			local f = Instance.new("Part", workspace)
			f.Transparency = 1
			f.Anchored = true
			local kek = false
			repeat
				rs:wait()
				if e then
					f.CFrame = e.CFrame
					if e:FindFirstChild("Mesh") then
						f.Size = e:FindFirstChild("Mesh").Scale
					else
						kek = true
					end
				end
			until kek == true
			f:Destroy()
		end
	end
end)
mouse.KeyDown:connect(function(key)
	if plr == lplr and key == "r" and debounce == false and currentmode == modeslist[5] then
		debounce = true
		animsync = true
		noidle = true
		do
			local bg = Instance.new("BodyGyro", root)
			bg.Name = "lolnochara"
			bg.P = 10000
			bg.D = 100
			bg.MaxTorque = Vector3.new(10000, 10000, 10000)
			local spd = 0.4
			for i = 1, 5 do
				rs:wait()
				hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0), spd)
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(math.rad(0), math.rad(-75), math.rad(0)), spd)
				larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-90)), spd)
				rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(40)), spd)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(-80), math.rad(0)), spd)
				lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), spd)
				rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), spd)
				if jumped == false then
					bg.CFrame = CFrame.new(root.Position, Vector3.new(mouse.Hit.x, root.Position.Y, mouse.Hit.z))
				else
					bg.CFrame = CFrame.new(root.Position, mouse.Hit.p)
				end
			end
			sound(1837831472, root.Position, 10, math.random(8, 10) / 10)
			sound(1019401548, root.Position, 10, math.random(18, 20) / 10)
			local Position = larm.Position
			local Target = mouse.Hit.p
			local direction = Target - Position
			local direction = computeDirection(direction)
			local ray = Ray.new(Position, (Target - Position).unit * 1048)
			local part, endPoint = workspace:FindPartOnRay(ray, char)
			local pos = Position + direction * (Position - endPoint).magnitude / 2
			CEffect(Enum.MeshType.Cylinder, Vector3.new((Position - endPoint).magnitude, 1, 1), 0, Enum.Material.Neon, modesettings[currentmode].colorb, CFrame.new(pos, endPoint) * CFrame.Angles(math.pi / 2, 0, math.rad(90)), Vector3.new(), Vector3.new(0, 1, 1) * -0.025, Vector3.new(), 0, 0)
			Effect(Enum.MeshType.Sphere, Vector3.new(1, 1, 1), 0.7, Enum.Material.Neon, modesettings[currentmode].colorb, endPoint, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) * 1, Vector3.new(), 0, -0.015)
			for i = 1, 15 do
				Effect(Enum.MeshType.Brick, Vector3.new(1, 1, 1) * 5, 0, Enum.Material.Neon, modesettings[currentmode].colorb, endPoint, Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360)), Vector3.new(math.random(-20, 20) / 10, math.random(-20, 20) / 10, math.random(-20, 20) / 10) * (size / 2), Vector3.new(-0.2, -0.2, -0.2), Vector3.new(math.random(-20, 20) / 10, math.random(-20, 20) / 10, math.random(-20, 20) / 10), 0, 0)
			end
			sound(262562442, endPoint, 10, math.random(90, 170) / 100)
			sound(268249319, endPoint, 10, math.random(180, 200) / 100)
			sound(2364677393, endPoint, 2, math.random(100, 110) / 100)
			root.Velocity = root.Velocity + root.CFrame.lookVector * -20
			local Position = endPoint
			coroutine.resume(coroutine.create(function()
				for i = 1, 120 do
					rs:wait()
					local Target = endPoint + Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)) / 100
					local direction = Target - Position
					local direction = computeDirection(direction)
					local ray = Ray.new(Position, (Target - Position).unit * math.random(5, 20))
					local part, endPoint = workspace:FindPartOnRay(ray, char)
					local pos = Position + direction * (Position - endPoint).magnitude / 2
					Effect(Enum.MeshType.Wedge, Vector3.new(0, 5, 5), 0, Enum.Material.Neon, modesettings[currentmode].colorb, endPoint, Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)) / 100 * 360, Vector3.new(), Vector3.new(0, -0.5, -0.5), Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)) / 100 * 2, 0, 0)
					for i, v in pairs(findAllNearestTorso(endPoint, 20)) do
						local hit = v.Parent
						if hit:FindFirstChildOfClass("Humanoid") then
							local hum = hit:FindFirstChildOfClass("Humanoid")
							if hum.MaxHealth > 1.0E100 then
								--remote:FireServer("breakjoints", v.Parent)
							else
								--remote:FireServer("damage", hum, hum.MaxHealth / math.random(200, 205))
							end
						end
					end
				end
			end))
			for i = 1, 5 do
				rs:wait()
				hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0), spd)
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(math.rad(0), math.rad(-75), math.rad(0)), spd)
				larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-90)), spd)
				rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(40)), spd)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(-80), math.rad(0)), spd)
				lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), spd)
				rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), spd)
				if jumped == false then
					bg.CFrame = CFrame.new(root.Position, Vector3.new(mouse.Hit.x, root.Position.Y, mouse.Hit.z))
				else
					bg.CFrame = CFrame.new(root.Position, mouse.Hit.p)
				end
			end
			bg:Destroy()
			debounce = false
			animsync = false
			noidle = false
		end
	end
end)
mouse.KeyDown:connect(function(key)
	if plr == lplr then
		if key == "r" and debounce == false and currentmode == modeslist[7] then
			debounce = true
			animsync = true
			noidle = true
			local tempattach = Instance.new("Attachment", root)
			tempattach.Position = Vector3.new(0, 0, -10)
			for i = 1, 30 do
				rs:wait()
				sound(270923795, root.Position, 10, 5)
				local temppos = root.Position
				local meshs = {
					"735240054",
					"735240541",
					"735241042",
					"735241392",
					"735241628"
				}
				Effect(meshs[math.random(1, #meshs)], Vector3.new(10, 1, 10) * 0.1, 0.2, Enum.Material.Ice, modesettings[currentmode].colora, root.Position + root.CFrame.lookVector * 5 + Vector3.new(0, -2.9, 0), Vector3.new(0, math.random(0, 360), 0), Vector3.new(), Vector3.new(1, 0.01, 1) * -0.1, Vector3.new(), 0, 0)
				root.CFrame = CFrame.new(tempattach.WorldPosition) * CFrame.Angles(0, rad(root.Orientation.Y), 0)
				root.Velocity = Vector3.new()
				for i, v in pairs(findAllNearestTorso(root.Position, 30)) do
					local hum = v.Parent:FindFirstChildOfClass("Humanoid")
					--remote:FireServer("damage", hum, hum.MaxHealth / 75)
				end
				for i = 1, 2 do
					local meshs = {
						"735240054",
						"735240541",
						"735241042",
						"735241392",
						"735241628"
					}
					local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
					Effect(meshs[math.random(1, #meshs)], Vector3.new(1, 1, 1) * 0.5, 0.2, Enum.Material.Neon, modesettings[currentmode].colorb, root.Position + root.CFrame.lookVector * 5 + Vector3.new(0, -2.9, 0) + Vector3.new(math.random(-20, 20) / 10, 0, math.random(-20, 20) / 10) * 5, Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360)), Vector3.new(), Vector3.new(-0.05, -0.05, -0.05), Vector3.new(), 0, 0)
				end
				woosh = true
				hed.Weld.C0 = CFrame.new(0, 1.5, -0.1) * CFrame.Angles(0, 0, 0)
				hed.Weld.C1 = CFrame.Angles(rad(0), rad(70), 0)
				larm.Weld.C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(rad(-40), rad(0), rad(-80))
				rarm.Weld.C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(rad(-40), rad(0), rad(50))
				torso.Weld.C0 = CFrame.new(0, -0.5, 0) * CFrame.Angles(rad(0), rad(70), rad(0))
				lleg.Weld.C0 = CFrame.new(-0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(0), rad(-20))
				rleg.Weld.C0 = CFrame.new(0.5, -0.95, 0) * CFrame.Angles(rad(0), rad(0), rad(20))
			end
			debounce = false
			animsync = false
			noidle = false
		end
		if key == "f" and debounce == false and currentmode == modeslist[7] then
			animsync = true
			debounce = true
			local mousepos = mouse.Hit.p
			if (mousepos - root.Position).magnitude <= 100 then
				sound(399773107, mousepos, 10, math.random(100, 120) / 100)
				sound(1837831460, mousepos, 10, math.random(100, 120) / 100)
				local spd = 0.4
				for i = 1, 10 do
					rs:wait()
					hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
					hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(rad(0), rad(40), rad(0)), spd)
					larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
					rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(rad(170), rad(0), rad(50)), spd)
					torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -0.5, 0) * CFrame.Angles(rad(0), rad(40), rad(0)), spd)
				end
				Effect(Enum.MeshType.Sphere, Vector3.new(10, 10, 10), 0, Enum.Material.Neon, modesettings[currentmode].colorb, mousepos, Vector3.new(), Vector3.new(), Vector3.new(1, 1, 1) * 2.5, Vector3.new(), 0.1, -0.05)
				for i, v in pairs(findAllNearestTorso(mousepos, 15)) do
					--remote:FireServer("damage", v.Parent:FindFirstChildOfClass("Humanoid"), v.Parent:FindFirstChildOfClass("Humanoid").MaxHealth / math.random(5, 6))
				end
				for i = 1, 15 do
					local meshs = {
						"735240054",
						"735240541",
						"735241042",
						"735241392",
						"735241628"
					}
					local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
					Effect(meshs[math.random(1, #meshs)], Vector3.new(1, 1, 1) * 0.2, 0, Enum.Material.Neon, modesettings[currentmode].colorb, mousepos, Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360)), Vector3.new(math.random(-20, 20) / 10, math.random(-40, 40) / 10, math.random(-20, 20) / 10) / 5, Vector3.new(-0.005, -0.005, -0.005), Vector3.new(math.random(-20, 20) / 10, math.random(-20, 20) / 10, math.random(-20, 20) / 10) * 2, 0, 0)
				end
				local meshs = {
					"735240054",
					"735240541",
					"735241042",
					"735241392",
					"735241628"
				}
				Effect(meshs[math.random(1, #meshs)], Vector3.new(10, 10, 10) / 20, 0.2, Enum.Material.Ice, modesettings[currentmode].colora, mousepos, Vector3.new(), Vector3.new(), Vector3.new(1, 5, 1) / 40, Vector3.new(), 0, -0.02)
			else
				local e = sond(184734960, root.Position, 10, 1.5)
				e.Parent = char
			end
			debounce = false
			animsync = false
		end
	end
end)
local debounceimpact = false
function jumpimpact()
	if debounceimpact == false then
		debounceimpact = true
		if jumppower < -150 then
			jumppower = -150
		end
		shake(-jumppower / 5)
		sound(131436155, lleg.Position, 5, math.random(7, 8) / 10)
		for i = 1, -jumppower / 20 do
			rs:wait()
			hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.Angles(0, 0, 0), 0.05)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, jumppower / 20 - hum.HipHeight, 0) * CFrame.Angles(rad(0), rad(0), rad(0)), 0.05)
		end
		debounceimpact = false
	end
end
max = 0
function renderstepped()
	hum.MaxHealth = 1.0E100
	hum.Health = hum.MaxHealth
	if lplr ~= plr then
		if p.Character.Parent == nil then
			local model = Instance.new("Model")
			model.Name = p.Name
			p.Character = model
			for i, v in pairs(char:GetChildren()) do
				v.Parent = p.Character
			end
		end
		char = p.Character
		if p.Character.Parent ~= workspace then
			p.Character.Parent = workspace
		end
		for i, v in pairs(char:GetChildren()) do
			if v:IsA("Accoutrement") then
				if v.Handle:FindFirstChild("Mesh") then
					v.Handle:FindFirstChild("Mesh").Offset = Vector3.new()
					v.Handle.Transparency = 0
				end
			elseif v:IsA("BasePart") then
				v.Anchored = false
				if v:FindFirstChildOfClass("BodyPosition") then
					v:FindFirstChildOfClass("BodyPosition"):Destroy()
				end
				if v:FindFirstChildOfClass("BodyVelocity") then
					v:FindFirstChildOfClass("BodyVelocity"):Destroy()
				end
				if v:FindFirstChildOfClass("BodyGyro") and v:FindFirstChildOfClass("BodyGyro").Name ~= "lolnochara" then
					v:FindFirstChildOfClass("BodyGyro"):Destroy()
				end
				if v:FindFirstChild("Mesh") then
					v:FindFirstChild("Mesh").Offset = Vector3.new()
				end
				if not DebrisModel:FindFirstChild(v.Name .. "FORCEFIELD") then
					local force = Instance.new("Part", DebrisModel)
					force.Name = v.Name .. "FORCEFIELD"
					if v ~= hed then
						force.Size = v.Size + Vector3.new(1, 1, 1) * 0.2
					else
						force.Size = Vector3.new(1, 1, 1) * v.Size.Y + Vector3.new(1, 1, 1) * 0.2
					end
					force.CanCollide = false
					force.Transparency = 1
					force.Color = Color3.new(0, 1, 1)
					force.Material = Enum.Material.Neon
					newWeld(v, force, 0, 0, 0)
				elseif not DebrisModel:FindFirstChild(v.Name .. "FORCEFIELD"):FindFirstChildOfClass("Weld") then
					newWeld(v, DebrisModel:FindFirstChild(v.Name .. "FORCEFIELD"), 0, 0, 0)
				end
				if v.Name ~= "HumanoidRootPart" then
					v.Transparency = 0
				else
					v.Transparency = 1
				end
			end
		end
	end
end
local freeze = false
mouse.KeyDown:connect(function(key)
	if plr == lplr and key == "z" and debounce == false then
		debounce = true
		noidle = true
		noidle2 = true
		animsync = true
		freeze = true
		do
			local asd
			local asd2 = false
			asd = mouse.KeyDown:connect(function(key)
				if key == "z" and plr == lplr then
					asd2 = true
					asd:Disconnect()
				end
			end)
			local rdm = math.random(1, 2)
			local spd = 0.05
			repeat
				rs:wait()
				if rdm == 1 then
					hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
					hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(rad(10), rad(0), rad(0)), spd)
					larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55, 0) * CFrame.Angles(rad(70), rad(0), rad(40)), spd)
					rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.45, 0) * CFrame.Angles(rad(-10), rad(-10), rad(0)), spd)
					torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -3, 0) * CFrame.Angles(rad(20), rad(0), rad(0)), spd)
					lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, 0.2, -0.5) * CFrame.Angles(rad(20), rad(0), rad(0)), spd)
					rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.75, 0) * CFrame.Angles(rad(70), rad(0), rad(10)), spd)
				elseif rdm == 2 then
					hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -0.1) * CFrame.Angles(rad(0), rad(0), rad(0)), spd)
					hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(rad(20), rad(-50), rad(0)), spd)
					larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.55, 0) * CFrame.Angles(rad(-20), rad(0), rad(0)), spd)
					rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.55, 0) * CFrame.Angles(rad(-10), rad(-10), rad(0)), spd)
					torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -2.8, 0) * CFrame.Angles(rad(20), rad(-50), rad(20)), spd)
					lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, 0.2, -0.5) * CFrame.Angles(rad(20), rad(0), rad(20)), spd)
					rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.75, 0) * CFrame.Angles(rad(70), rad(0), rad(20)), spd)
				end
			until asd2 == true
			noidle = false
			noidle2 = false
			animsync = false
			debounce = false
			freeze = false
		end
	end
end)
local neoncolor = 0
local neonbright = 0

if plr == lplr then
	changemode(1)
else
	repeat
		rs:wait()
	until currentmodenumber ~= nil
	changemodo(currentmodenumber)
	repeat
		rs:wait()
	until currentmusic ~= nil
	musik(currentmusic)
end
mouse.KeyDown:connect(function(key)
	key = string.lower(key)
	if string.byte(key) == 50 then
		do
			local walkinglocal = true
			local keyConnection = mouse.KeyUp:connect(function(key)
				if string.byte(key) == 50 then
					walkinglocal = false
				end
			end)
			walking = true
			repeat
				rs:wait()
			until walkinglocal == false
			keyConnection:disconnect()
			walking = false
		end
	end
end)
local Prefix = "/e "
p.Chatted:connect(function(msg)
	if plr == lplr then
		if msg:lower():sub(1, #Prefix + #"play ") == Prefix .. "play " and currentmode == "Visualizer" then
			local v = tonumber(msg:sub(#Prefix + #"play " + 1))
			print("Playing id \"" .. v .. "\"")
			music(v)
			max = 50
		elseif msg:lower():sub(1, #Prefix + #"stop") == Prefix .. "stop" and currentmode == "Visualizer" then
			music("Stop")
		elseif msg:lower():sub(1, #Prefix + #"prefix ") == Prefix .. "prefix " then
			local v = msg:sub(#Prefix + #"prefix " + 1)
			print("Prefix changed to \"" .. v .. "\"")
			Prefix = tostring(v)
		end
	end
end)
local light = Instance.new("PointLight", torso)
if plr == lplr then
	local HMain = Instance.new("Frame", GUI)
	modegui = Instance.new("TextLabel")
	HMain.AnchorPoint = Vector2.new(0.5, 1)
	HMain.Position = UDim2.new(0.5, 0, 1, -35)
	HMain.BackgroundColor3 = Color3.new(0, 0, 0)
	HMain.BackgroundTransparency = 1
	HMain.Size = UDim2.new(0, 0, 0, 0)
	modegui.Parent = HMain
	modegui.AnchorPoint = Vector2.new(0.5, 0.5)
	modegui.Position = UDim2.new(0.5, 0, 0.5, 0)
	modegui.BackgroundTransparency = 0.8
	modegui.BackgroundColor3 = Color3.new(255, 255, 255)
	modegui.BorderColor3 = Color3.new(0, 0, 0)
	modegui.BorderSizePixel = 2
	modegui.Size = UDim2.new(0, 150, 0, 50)
	modegui.Font = "Code"
	modegui.Text = "\227\128\140DIMENSIONA\227\128\141"
	modegui.TextSize = 20
	modegui.TextColor3 = Color3.new(0, 0, 0)
	modegui.TextStrokeColor3 = Color3.new(255, 255, 255)
	modegui.TextStrokeTransparency = 0
end
local HBill2 = Instance.new("BillboardGui", hed)
local HMain2 = Instance.new("Frame", HBill2)
HName2 = Instance.new("TextLabel")
HBill2.Size = UDim2.new(15, 0, 2.2, 0)
HBill2.StudsOffset = Vector3.new(3.675, 1.2, 0)
HBill2.AlwaysOnTop = true
HBill2.Enabled = true
HMain2.BackgroundColor3 = Color3.new(0, 0, 0)
HMain2.BackgroundTransparency = 1
HMain2.Size = UDim2.new(0.5, 0, 0.2, 0)
HName2.Parent = HMain2
HName2.BackgroundTransparency = 1
HName2.BackgroundColor3 = Color3.new(255, 255, 255)
HName2.BorderColor3 = Color3.new(0, 0, 0)
HName2.BorderSizePixel = 2
HName2.Size = UDim2.new(1, 0, 0.75, 0)
HName2.Font = "Code"
HName2.Text = "MODE"
HName2.TextScaled = true
HName2.TextColor3 = Color3.new(0.5, 0.5, 0.5)
HName2.TextStrokeColor3 = Color3.new(0.1, 0.1, 0.1)
HName2.TextStrokeTransparency = 0
HName2.TextYAlignment = "Bottom"
local HBill = Instance.new("BillboardGui", hed)
local HMain = Instance.new("Frame", HBill)
HName = Instance.new("TextLabel")
HBill.Size = UDim2.new(15, 0, 2.2, 0)
HBill.StudsOffset = Vector3.new(3.675, 2, 0)
HBill.AlwaysOnTop = true
HBill.Enabled = true
HMain.BackgroundColor3 = Color3.new(0, 0, 0)
HMain.BackgroundTransparency = 1
HMain.Size = UDim2.new(0.5, 0, 0.5, 0)
HName.Parent = HMain
HName.BackgroundTransparency = 1
HName.BackgroundColor3 = Color3.new(255, 255, 255)
HName.BorderColor3 = Color3.new(0, 0, 0)
HName.BorderSizePixel = 2
HName.Size = UDim2.new(1, 0, 0.75, 0)
HName.Font = "Code"
HName.Text = "\227\128\140DIMENSIONA\227\128\141"
HName.TextScaled = true
HName.TextColor3 = Color3.new(0, 0, 0)
HName.TextStrokeColor3 = Color3.new(255, 255, 255)
HName.TextStrokeTransparency = 0
HName.TextYAlignment = "Bottom"

bambam = Instance.new("BodyThrust")
bambam.Parent = HumanRoot
bambam.Force = Vector3.new(1000,1000,1000)
bambam.Location = HumanRoot.Position

while HumanDied ~= true do
	rswait()
	HumanRoot.Position = root.Position
	bambam.Location = HumanRoot.Position

	light.Color = modesettings[currentmode].colorb
	HName.TextColor3 = modesettings[currentmode].colora
	HName.TextStrokeColor3 = modesettings[currentmode].colorb
	local e = -0.5 + (root.Position - workspace.CurrentCamera.CFrame.Position).magnitude / 20
	if e < 0 then
		e = 0
	end
	HName.TextTransparency = e
	HName.TextStrokeTransparency = HName.TextTransparency
	HName2.TextTransparency = HName.TextTransparency
	HName2.TextStrokeTransparency = HName.TextTransparency
	HName2.Text = "-" .. currentmode .. "-"
	if walking == false then
		change = 1
		movement = 20
		if freeze then
			hum.WalkSpeed = 1
		else
			hum.WalkSpeed = 120
		end
	else
		change = 0.5
		movement = 8
		if freeze then
			hum.WalkSpeed = 1
		else
			hum.WalkSpeed = 20
		end
	end
	if neoncolor > 1 then
		neoncolor = 0
	else
		neoncolor = neoncolor + 0.002
	end
	if currentmode == "Visualizer" then
		local neoncolor2 = neoncolor - 0.07
		if neoncolor2 < 0 then
			neoncolor2 = neoncolor2 + 1
		end
		if char:FindFirstChild("MusicRuin") and soundz then
			if max < soundz.PlaybackLoudness then
				max = soundz.PlaybackLoudness
			end
			if soundz.PlaybackLoudness > max * 0.78 then
				neonbright = 1
			else
				if neonbright < soundz.PlaybackLoudness / 600 then
					neonbright = soundz.PlaybackLoudness / 600
				end
				if neonbright > 0 then
					neonbright = neonbright - 0.05
				end
			end
			if char:FindFirstChild("MusicRuin").Playing then
				if (torso.Velocity * Vector3.new(1, 0, 1)).magnitude < 5 then
					change = 0.1 + soundz.PlaybackLoudness / 300
				end
				modesettings[currentmode].colora = Color3.fromHSV(neoncolor2, 1, neonbright / 4 / 2 + 0.1)
				modesettings[currentmode].colorb = Color3.fromHSV(neoncolor, 1, neonbright)
			else
				modesettings[currentmode].colora = Color3.fromHSV(neoncolor2, 1, 0.225)
				modesettings[currentmode].colorb = Color3.fromHSV(neoncolor, 1, 1)
			end
		end
		for i = 1, 2 do
			local wong
			if i == 1 then
				wong = wing1
			else
				wong = wing2
			end
			partchange(wong.center.a, modesettings[currentmode].materiala, modesettings[currentmode].colora)
			partchange(wong.a.a.a, modesettings[currentmode].materiala, modesettings[currentmode].colora)
			partchange(wong.a.b.a, modesettings[currentmode].materiala, modesettings[currentmode].colora)
			partchange(wong.b.a.a, modesettings[currentmode].materiala, modesettings[currentmode].colora)
			partchange(wong.b.b.a, modesettings[currentmode].materiala, modesettings[currentmode].colora)
			partchange(wong.c.a.a, modesettings[currentmode].materiala, modesettings[currentmode].colora)
			partchange(wong.c.b.a, modesettings[currentmode].materiala, modesettings[currentmode].colora)
			partchange(wong.center.b, modesettings[currentmode].materialb, modesettings[currentmode].colorb)
			partchange(wong.a.a.b, modesettings[currentmode].materialb, modesettings[currentmode].colorb)
			partchange(wong.a.b.b, modesettings[currentmode].materialb, modesettings[currentmode].colorb)
			partchange(wong.b.a.b, modesettings[currentmode].materialb, modesettings[currentmode].colorb)
			partchange(wong.b.b.b, modesettings[currentmode].materialb, modesettings[currentmode].colorb)
			partchange(wong.c.a.b, modesettings[currentmode].materialb, modesettings[currentmode].colorb)
			partchange(wong.c.b.b, modesettings[currentmode].materialb, modesettings[currentmode].colorb)
		end
		partchange(sword.a, modesettings[currentmode].materiala, modesettings[currentmode].colora)
		partchange(sword.b, modesettings[currentmode].materialb, modesettings[currentmode].colorb)
		partchange(sword.c, Enum.Material.SmoothPlastic, modesettings[currentmode].colorc)
		partchange(headphone.a, modesettings[currentmode].materiala, modesettings[currentmode].colora)
		partchange(headphone.b, modesettings[currentmode].materialb, modesettings[currentmode].colorb)
		for i, v in pairs(trails) do
			v.Color = ColorSequence.new(modesettings[currentmode].colorb)
		end
	else
		modesettings.Visualizer.colora = Color3.fromRGB(80, 80, 80)
		modesettings.Visualizer.colorb = Color3.fromHSV(0, 0, 1)
	end
	for i, v in pairs(DebrisModel:GetChildren()) do
		if v.Name == "LIGHTNING" then
			local vm = v:FindFirstChildOfClass("BlockMesh")
			vm.Scale = vm.Scale - Vector3.new(0.05, 0.05, 0)
			if 0 >= vm.Scale.X then
				v:Destroy()
			end
		end
	end
	local ray1 = Ray.new(root.Position + Vector3.new(size, 0, 0), Vector3.new(0, -4, 0))
	local part1, endPoint = workspace:FindPartOnRay(ray1, char)
	local ray2 = Ray.new(root.Position - Vector3.new(size, 0, 0), Vector3.new(0, -4, 0))
	local part2, endPoint = workspace:FindPartOnRay(ray2, char)
	local ray3 = Ray.new(root.Position + Vector3.new(0, 0, size / 2), Vector3.new(0, -4, 0))
	local part3, endPoint = workspace:FindPartOnRay(ray3, char)
	local ray4 = Ray.new(root.Position - Vector3.new(0, 0, size / 2), Vector3.new(0, -4, 0))
	local part4, endPoint = workspace:FindPartOnRay(ray4, char)
	local ray5 = Ray.new(root.Position + Vector3.new(size, 0, size / 2), Vector3.new(0, -4, 0))
	local part5, endPoint = workspace:FindPartOnRay(ray5, char)
	local ray6 = Ray.new(root.Position - Vector3.new(size, 0, size / 2), Vector3.new(0, -4, 0))
	local part6, endPoint = workspace:FindPartOnRay(ray6, char)
	local ray7 = Ray.new(root.Position + Vector3.new(size, 0, -size / 2), Vector3.new(0, -4, 0))
	local part7, endPoint = workspace:FindPartOnRay(ray7, char)
	local ray8 = Ray.new(root.Position - Vector3.new(size, 0, -size / 2), Vector3.new(0, -4, 0))
	local part8, endPoint = workspace:FindPartOnRay(ray8, char)
	local ray = Ray.new(root.Position, Vector3.new(0, -6, 0))
	local part, endPoint = workspace:FindPartOnRay(ray, char)
	if part1 or part2 or part3 or part4 or part5 or part6 or part7 or part8 then
		jumped = false
	else
		endPoint = 0
		jumped = true
	end
	if plr == lplr and drew == true then
		modegui.Rotation = 4 * math.sin(sine / 40)
		modegui.TextColor3 = modesettings[currentmode].colora
		modegui.TextStrokeColor3 = modesettings[currentmode].colorb
		modegui.BackgroundColor3 = modesettings[currentmode].colorb
		modegui.BorderColor3 = modesettings[currentmode].colora
		ImageLabeleffect.ImageColor3 = modesettings[currentmode].colorb
		if custom_outfits == true then
			p:ClearCharacterAppearance()
			if hed:FindFirstChild("face") then
				hed:FindFirstChild("face"):Destroy()
			end
		end
		for i, v in pairs(sword:GetChildren()) do
			for i, z in pairs(v:GetChildren()) do
				if z:isA("BasePart") then
					z.LocalTransparencyModifier = 0
				end
			end
		end
		rarm.LocalTransparencyModifier = 0
		larm.LocalTransparencyModifier = 0
		rleg.LocalTransparencyModifier = 0
		lleg.LocalTransparencyModifier = 0
		if root.Position.Y < workspace.FallenPartsDestroyHeight + 200 then
			char:MoveTo(Vector3.new(0, 0, 0))
		end
		if 0 < hum.Health then
			if (root.Velocity * Vector3.new(1, 0, 1)).magnitude >= 5 and jumped == false then
				animationwing("Run")
			elseif jumped == true then
				jumppower = root.Velocity.Y
				animationwing("Jump")
			elseif (torso.Velocity * Vector3.new(1, 0, 1)).magnitude < 5 then
				animationwing("Idle")
			end
		end
		if 0 < hum.Health then
			if hum.Sit == false then
				if (root.Velocity * Vector3.new(1, 0, 1)).magnitude >= 5 and jumped == false then
					animation("Run")
				elseif jumped == true then
					didjump = true
					jumppower = root.Velocity.Y
					animation("Jump")
				elseif (torso.Velocity * Vector3.new(1, 0, 1)).magnitude < 5 then
					animation("Idle")
				else
					animation("Sit")
				end
			end
			if didjump and jumped == false then
				jumpimpact(jumppower)
				didjump = false
			end
			if (torso.Velocity * Vector3.new(1, 0, 1)).magnitude >= 5 and jumped == false and noidle == false then
				if hed:FindFirstChild("Running") then
					hed.Running:Destroy()
					if char:FindFirstChild("Sound") and char:FindFirstChild("Sound"):IsA("Script") then
						char.Sound:Destroy()
					end
				end
				if math.cos(sine / 4) / 2 <= -0.2 and sidestep == 0 then
					local a = sound(131436155, rleg.Position, 2, math.random(7, 8) / 10)
					a.Parent = rleg
					sidestep = 1
				end
				if math.cos(sine / 4) / 2 >= 0.2 and sidestep == 1 then
					local a = sound(131436155, lleg.Position, 2, math.random(7, 8) / 10)
					a.Parent = lleg
					sidestep = 0
				end
			end
			if skin_custom then
				hed.BrickColor = skin_color
				torso.BrickColor = skin_color
				rarm.BrickColor = skin_color
				larm.BrickColor = skin_color
				rleg.BrickColor = skin_color
				lleg.BrickColor = skin_color
			end
			local timepos
			if soundz then
				timepos = soundz.TimePosition
			end
			--remote:FireServer("rs")
			local stuffs = {
				hed.Weld.C0,
				hed.Weld.C1,
				larm.Weld.C0,
				rarm.Weld.C0,
				torso.Weld.C0,
				lleg.Weld.C0,
				rleg.Weld.C0
			}
			--remote:FireServer("coords", stuffs, sine, pose, wingpose, animsync, walking, currentmodenumber, timepos, currentmusic, freeze, neoncolor)
		end
	end
	if plr ~= lplr and drew then
		noidle = false
		noidle2 = false
		animationwing(wingpose)
		if animsync == false then
			animation(pose)
		end
	end
	if drew then
		if blinktime > 0 then
			blinktime = blinktime - 1
		end
		if blinktime <= 0 then
			if blinking == false then
				blinking = true
				blinktime = 10
			else
				blinking = false
				blinktime = 250
			end
		end
	end
	if pose == "Idle" then
		local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
		local asd2 = Vector3.new(math.random(-10000, 10000) / 10000, 0, math.random(-10000, 10000) / 10000)
		Effekt(Enum.MeshType.Sphere, Vector3.new(0.8, 1, 0.8) * 3, 0, Enum.Material.Neon, modesettings[currentmode].colorb, endPoint + asd2 * 8, asd * 3, root.Velocity / 110, Vector3.new(-0.5, 2, -0.5) / 1.6, Vector3.new(), 0, 0)
		if 0.5 < math.cos(sine) and woosh == false then
			local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
			local asd2 = Vector3.new(math.random(-10000, 10000) / 10000, 0, math.random(-10000, 10000) / 10000)
			local asd3 = math.random(-10000, 10000) / 10000
			Effekt(559831844, Vector3.new(0.001, 0.001, 0.1), 0, Enum.Material.Neon, modesettings[currentmode].colorb, endPoint + asd / 5, Vector3.new(90, 0, 0) + asd * 4, Vector3.new(0, 0, 0), Vector3.new(0.05, 0.05, 0) + Vector3.new(1, 1, 0) * (asd3 * 0.02), Vector3.new(), 0.05, 0)
			woosh = true
		elseif 0.5 > math.cos(sine) then
			woosh = false
		end
	end
	if char:FindFirstChild("MusicRuin") then
		local e = -0.5 + (root.Position - workspace.CurrentCamera.CFrame.Position).magnitude / 8
		if e < 0 then
			e = 0
		end
		if e > 10 then
			e = 10
		end
		char:FindFirstChild("MusicRuin").Volume = 10 - e + 0.1
	end
	local asd = Vector3.new(math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000, math.random(-10000, 10000) / 10000)
	local asd2 = Vector3.new(math.random(-10000, 10000) / 10000, 0, math.random(-10000, 10000) / 10000)
	if currentmode == modeslist[1] then
		Effekt(Enum.MeshType.Brick, Vector3.new(0.2, 0.2, 0.2), 0, Enum.Material.Neon, modesettings[currentmode].colorb, root.Position + asd * 3, asd * 360, root.Velocity / 110 + asd / 10, Vector3.new(1, 1, 1) * 0.008, asd * 5, 0.04, 0)
	elseif currentmode == modeslist[2] then
		Effekt(Enum.MeshType.Wedge, Vector3.new(0, 1, 1), 0, Enum.Material.Neon, modesettings[currentmode].colorb, root.Position + asd * 3, asd * 360, root.Velocity / 110 + asd / 2, Vector3.new(0, 0, 0), asd * 5, 0.1, 0)
	elseif currentmode == modeslist[3] then
		Effekt(Enum.MeshType.Sphere, Vector3.new(0.2, 0.2, 0.2), 0, Enum.Material.Neon, Color3.new(0, 1, 1), root.Position + asd * 3, asd * 360, root.Velocity / 110 + asd / 10, Vector3.new(1, 1, 1) * -0.01, asd * 5, 0, 0)
	elseif currentmode == modeslist[4] then
		Effekt(Enum.MeshType.Brick, Vector3.new(0, 0.2, 0.2), 0, Enum.Material.Neon, modesettings[currentmode].colorb, root.Position + asd * 3, asd * 360, root.Velocity / 110 + asd / 10, Vector3.new(0, 0, 0), asd * 5, 0.04, 0)
	elseif currentmode == modeslist[5] then
		Effekt(Enum.MeshType.Wedge, Vector3.new(0, 0.5, 0.5), 0, Enum.Material.Neon, modesettings[currentmode].colorb, root.Position + asd * 3, asd * 360, root.Velocity / 110 + asd / 5, Vector3.new(0, 1, 1) * -0.01, asd * 5, 0, 0)
	elseif currentmode == modeslist[6] then
		Effekt(Enum.MeshType.Brick, Vector3.new(0.5, 0.5, 0.5), 0, Enum.Material.Neon, modesettings[currentmode].colorb, root.Position + asd * 3, asd * 360, root.Velocity / 110 + asd / 2, Vector3.new(1, 1, 1) * 0.02, asd * 5, 0.04, 0)
	elseif currentmode == modeslist[7] then
		Effekt(Enum.MeshType.Brick, Vector3.new(0.1, 0.1, 0.1), 0, Enum.Material.Neon, modesettings[currentmode].colorb, root.Position + asd * 3, asd * 360, root.Velocity / 110 + asd / 40, Vector3.new(1, 1, 1) * -0.005, asd * 5, 0, 0)
	elseif currentmode == modeslist[8] then
		Effekt(Enum.MeshType.Wedge, Vector3.new(0, 1, 1), 0, Enum.Material.Neon, modesettings[currentmode].colorb, root.Position + asd * 3, asd * 360, root.Velocity / 110 + asd / 5, Vector3.new(0, 0, 0), asd * 5, 0.1, 0)
	end
	sine = sine + change
end
