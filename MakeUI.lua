local Messages
local MainFrame
local UIARMAINFRAME
local UICMAINFRAME
local MessagesFrame
local UICMSGFRAME
local UIPMSGFRAME
local BgScroll
local UICBIGSCROLL
local MessagesScrollingFrame
local MessageHoldingFrame
local PfpImage
local PFPUIC
local MsgHoldFrameUIC
local DisplayName
local MessageText
local UIPMSGSCROLL
local UILMSGSCROLL
local UIPMAINFRAME
local TextBoxHolder
local UICTEXTBOXHOLD
local MessageInputBox
local UICMSGINPUT
local UIPMSGINPUT
local UIPTExtboxhold
local SendButton
local UICSENDBUTTON
local SendImage

Messages = Instance.new("ScreenGui")
MainFrame = Instance.new("Frame")
UIARMAINFRAME = Instance.new("UIAspectRatioConstraint")
UICMAINFRAME = Instance.new("UICorner")
MessagesFrame = Instance.new("Frame")
UICMSGFRAME = Instance.new("UICorner")
UIPMSGFRAME = Instance.new("UIPadding")
BgScroll = Instance.new("Frame")
UICBIGSCROLL = Instance.new("UICorner")
MessagesScrollingFrame = Instance.new("ScrollingFrame")
MessageHoldingFrame = Instance.new("Frame")
PfpImage = Instance.new("ImageLabel")
PFPUIC = Instance.new("UICorner")
MsgHoldFrameUIC = Instance.new("UICorner")
DisplayName = Instance.new("TextLabel")
MessageText = Instance.new("TextLabel")
UIPMSGSCROLL = Instance.new("UIPadding")
UILMSGSCROLL = Instance.new("UIListLayout")
UIPMAINFRAME = Instance.new("UIPadding")
TextBoxHolder = Instance.new("Frame")
UICTEXTBOXHOLD = Instance.new("UICorner")
MessageInputBox = Instance.new("TextBox")
UICMSGINPUT = Instance.new("UICorner")
UIPMSGINPUT = Instance.new("UIPadding")
UIPTExtboxhold = Instance.new("UIPadding")
SendButton = Instance.new("ImageButton")
UICSENDBUTTON = Instance.new("UICorner")
SendImage = Instance.new("ImageLabel")


Messages.Name = "Messages"
Messages.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Messages.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = Messages
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)

UIARMAINFRAME.Name = "UIARMAINFRAME"
UIARMAINFRAME.Parent = MainFrame
UIARMAINFRAME.AspectRatio = 1.200

UICMAINFRAME.CornerRadius = UDim.new(0, 15)
UICMAINFRAME.Name = "UICMAINFRAME"
UICMAINFRAME.Parent = MainFrame

MessagesFrame.Name = "MessagesFrame"
MessagesFrame.Parent = MainFrame
MessagesFrame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
MessagesFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MessagesFrame.BorderSizePixel = 0
MessagesFrame.Size = UDim2.new(1, 0, 0.850000024, -5)

UICMSGFRAME.CornerRadius = UDim.new(0, 15)
UICMSGFRAME.Name = "UICMSGFRAME"
UICMSGFRAME.Parent = MessagesFrame

UIPMSGFRAME.Name = "UIPMSGFRAME"
UIPMSGFRAME.Parent = MessagesFrame
UIPMSGFRAME.PaddingBottom = UDim.new(0, 5)
UIPMSGFRAME.PaddingLeft = UDim.new(0, 5)
UIPMSGFRAME.PaddingRight = UDim.new(0, 5)
UIPMSGFRAME.PaddingTop = UDim.new(0, 5)

BgScroll.Name = "BgScroll"
BgScroll.Parent = MessagesFrame
BgScroll.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
BgScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
BgScroll.BorderSizePixel = 0
BgScroll.Size = UDim2.new(1, 0, 1, 0)

UICBIGSCROLL.CornerRadius = UDim.new(0, 15)
UICBIGSCROLL.Name = "UICBIGSCROLL"
UICBIGSCROLL.Parent = BgScroll

MessagesScrollingFrame.Name = "MessagesScrollingFrame"
MessagesScrollingFrame.Parent = BgScroll
MessagesScrollingFrame.Active = true
MessagesScrollingFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MessagesScrollingFrame.BackgroundTransparency = 1.000
MessagesScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MessagesScrollingFrame.BorderSizePixel = 0
MessagesScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
MessagesScrollingFrame.ScrollBarThickness = 0

MessageHoldingFrame.Name = "MessageHoldingFrame"
MessageHoldingFrame.Parent = MessagesScrollingFrame
MessageHoldingFrame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
MessageHoldingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MessageHoldingFrame.BorderSizePixel = 0
MessageHoldingFrame.Size = UDim2.new(1, 0, 0, 50)

PfpImage.Name = "PfpImage"
PfpImage.Parent = MessageHoldingFrame
PfpImage.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
PfpImage.BackgroundTransparency = 1.000
PfpImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
PfpImage.BorderSizePixel = 0
PfpImage.Size = UDim2.new(0, 50, 0, 50)
PfpImage.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

PFPUIC.CornerRadius = UDim.new(0, 15)
PFPUIC.Name = "PFPUIC"
PFPUIC.Parent = PfpImage

MsgHoldFrameUIC.CornerRadius = UDim.new(0, 15)
MsgHoldFrameUIC.Name = "MsgHoldFrameUIC"
MsgHoldFrameUIC.Parent = MessageHoldingFrame

DisplayName.Name = "DisplayName"
DisplayName.Parent = MessageHoldingFrame
DisplayName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DisplayName.BackgroundTransparency = 1.000
DisplayName.BorderColor3 = Color3.fromRGB(0, 0, 0)
DisplayName.BorderSizePixel = 0
DisplayName.Position = UDim2.new(0, 55, 0, 0)
DisplayName.Size = UDim2.new(1, -55, 0, 20)
DisplayName.Font = Enum.Font.FredokaOne
DisplayName.Text = "Display Name"
DisplayName.TextColor3 = Color3.fromRGB(180, 180, 180)
DisplayName.TextSize = 18.000
DisplayName.TextXAlignment = Enum.TextXAlignment.Left

MessageText.Name = "MessageText"
MessageText.Parent = MessageHoldingFrame
MessageText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MessageText.BackgroundTransparency = 1.000
MessageText.BorderColor3 = Color3.fromRGB(0, 0, 0)
MessageText.BorderSizePixel = 0
MessageText.Position = UDim2.new(0, 55, 0, 22)
MessageText.Size = UDim2.new(1, -55, 0, 25)
MessageText.Font = Enum.Font.FredokaOne
MessageText.Text = "Example Sigma Message Whatever HEEEEEEEEEEELPPPP WHAT THE VIRUS"
MessageText.TextColor3 = Color3.fromRGB(180, 180, 180)
MessageText.TextSize = 12.000
MessageText.TextWrapped = true
MessageText.TextXAlignment = Enum.TextXAlignment.Left

UIPMSGSCROLL.Name = "UIPMSGSCROLL"
UIPMSGSCROLL.Parent = MessagesScrollingFrame
UIPMSGSCROLL.PaddingBottom = UDim.new(0, 5)
UIPMSGSCROLL.PaddingLeft = UDim.new(0, 5)
UIPMSGSCROLL.PaddingRight = UDim.new(0, 5)
UIPMSGSCROLL.PaddingTop = UDim.new(0, 5)

UILMSGSCROLL.Name = "UILMSGSCROLL"
UILMSGSCROLL.Parent = MessagesScrollingFrame
UILMSGSCROLL.SortOrder = Enum.SortOrder.LayoutOrder
UILMSGSCROLL.Padding = UDim.new(0, 5)

UIPMAINFRAME.Name = "UIPMAINFRAME"
UIPMAINFRAME.Parent = MainFrame
UIPMAINFRAME.PaddingBottom = UDim.new(0, 5)
UIPMAINFRAME.PaddingLeft = UDim.new(0, 5)
UIPMAINFRAME.PaddingRight = UDim.new(0, 5)
UIPMAINFRAME.PaddingTop = UDim.new(0, 5)

TextBoxHolder.Name = "TextBoxHolder"
TextBoxHolder.Parent = MainFrame
TextBoxHolder.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
TextBoxHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBoxHolder.BorderSizePixel = 0
TextBoxHolder.Position = UDim2.new(0, 0, 0.850000024, 0)
TextBoxHolder.Size = UDim2.new(1, 0, 0.150000006, 0)

UICTEXTBOXHOLD.CornerRadius = UDim.new(0, 15)
UICTEXTBOXHOLD.Name = "UICTEXTBOXHOLD"
UICTEXTBOXHOLD.Parent = TextBoxHolder

MessageInputBox.Name = "MessageInputBox"
MessageInputBox.Parent = TextBoxHolder
MessageInputBox.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MessageInputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
MessageInputBox.BorderSizePixel = 0
MessageInputBox.Size = UDim2.new(1, -55, 1, 0)
MessageInputBox.ClearTextOnFocus = false
MessageInputBox.Font = Enum.Font.FredokaOne
MessageInputBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
MessageInputBox.PlaceholderText = "Message..."
MessageInputBox.Text = ""
MessageInputBox.TextColor3 = Color3.fromRGB(180, 180, 180)
MessageInputBox.TextSize = 14.000
MessageInputBox.TextWrapped = true
MessageInputBox.TextXAlignment = Enum.TextXAlignment.Left

UICMSGINPUT.CornerRadius = UDim.new(0, 15)
UICMSGINPUT.Name = "UICMSGINPUT"
UICMSGINPUT.Parent = MessageInputBox

UIPMSGINPUT.Name = "UIPMSGINPUT"
UIPMSGINPUT.Parent = MessageInputBox
UIPMSGINPUT.PaddingBottom = UDim.new(0, 5)
UIPMSGINPUT.PaddingLeft = UDim.new(0, 5)
UIPMSGINPUT.PaddingRight = UDim.new(0, 5)
UIPMSGINPUT.PaddingTop = UDim.new(0, 5)

UIPTExtboxhold.Name = "UIPTExtboxhold"
UIPTExtboxhold.Parent = TextBoxHolder
UIPTExtboxhold.PaddingBottom = UDim.new(0, 5)
UIPTExtboxhold.PaddingLeft = UDim.new(0, 5)
UIPTExtboxhold.PaddingRight = UDim.new(0, 5)
UIPTExtboxhold.PaddingTop = UDim.new(0, 5)

SendButton.Name = "SendButton"
SendButton.Parent = TextBoxHolder
SendButton.AnchorPoint = Vector2.new(1, 0.5)
SendButton.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
SendButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SendButton.BorderSizePixel = 0
SendButton.Position = UDim2.new(1, 0, 0.5, 0)
SendButton.Size = UDim2.new(0, 50, 1, 0)
SendButton.ImageRectOffset = Vector2.new(257, 257)
SendButton.ImageRectSize = Vector2.new(256, 256)

UICSENDBUTTON.CornerRadius = UDim.new(0, 15)
UICSENDBUTTON.Name = "UICSENDBUTTON"
UICSENDBUTTON.Parent = SendButton

SendImage.Name = "SendImage"
SendImage.Parent = SendButton
SendImage.AnchorPoint = Vector2.new(0.5, 0.5)
SendImage.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
SendImage.BackgroundTransparency = 1.000
SendImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
SendImage.BorderSizePixel = 0
SendImage.Position = UDim2.new(0.5, 0, 0.5, 0)
SendImage.Size = UDim2.new(1, -15, 1, -15)
SendImage.Image = "rbxassetid://16898734242"
SendImage.ImageColor3 = Color3.fromRGB(180, 180, 180)
SendImage.ImageRectOffset = Vector2.new(257, 257)
SendImage.ImageRectSize = Vector2.new(256, 256)