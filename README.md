

<img width="350" alt="demo" src="https://github.com/user-attachments/assets/fddf2c2e-d105-43c7-abc2-da1b3f980d64" />

# My Bottom Nav Bar ✨

A Flutter UI demo that showcases a custom liquid-glass bottom navigation bar with animated tab states, interactive glow feedback, elastic glass motion, and a floating add button.

This project uses:

- `flutter_bloc` for navigation state management
- `liquid_glass_renderer` for the glass, glow, stretch, and depth effects
- `flutter_svg` for SVG-based navigation icons

## Overview 🌟

The goal of this project is to build a modern custom bottom navigation bar that feels:

- soft
- premium
- interactive
- visually alive

Instead of using a standard bottom navigation widget, this project builds the full navigation bar manually using custom widgets and layered glass effects.

## Project Structure 🗂️

This structure reflects the latest local project version:

```text
my_bottom_nav_bar/
├── assets/
│   └── images/
│       └── main/
│           ├── ic_calendar_selected.svg
│           ├── ic_calendar_unselected.svg
│           ├── ic_home_selected.svg
│           ├── ic_home_unselected.svg
│           ├── ic_image.svg
│           ├── ic_messages_selected.svg
│           ├── ic_messages_unselected.svg
│           ├── ic_profile.svg
│           ├── ic_setting_selected.svg
│           └── ic_setting_unselected.svg
├── lib/
│   ├── app_colors.dart
│   ├── main.dart
│   └── features/
│       └── main/
│           └── presentation/
│               ├── manager/
│               │   └── main/
│               │       ├── main_bloc.dart
│               │       ├── main_event.dart
│               │       └── main_state.dart
│               ├── pages/
│               │   └── main_screen.dart
│               └── widgets/
│                   ├── my_bottom_nav/
│                   │   ├── add_event_button.dart
│                   │   ├── button_nav_item.dart
│                   │   ├── interactive_glow_surface.dart
│                   │   └── my_bottom_nav_bar.dart
│                   └── tabs/
│                       ├── calendar_tab.dart
│                       ├── home_tab.dart
│                       ├── messages_tab.dart
│                       └── profile_tab.dart
├── test/
│   └── widget_test.dart
├── pubspec.yaml
├── README.md
├── android/
├── ios/
├── web/
├── linux/
├── macos/
└── windows/
```

## Architecture Summary 🏗️

### Core files

- `lib/main.dart`
  - App entry point.
- `lib/app_colors.dart`
  - Holds the shared color palette used across the project.

### State management

- `lib/features/main/presentation/manager/main/main_bloc.dart`
  - Handles tab switching logic.
- `lib/features/main/presentation/manager/main/main_event.dart`
  - Defines events like `ChangeTabEvent`.
- `lib/features/main/presentation/manager/main/main_state.dart`
  - Stores the selected tab index.

### Main screen

- `lib/features/main/presentation/pages/main_screen.dart`
  - Hosts the `Scaffold`, current page body, and custom bottom navigation bar.

### UI widgets

- `lib/features/main/presentation/widgets/my_bottom_nav/my_bottom_nav_bar.dart`
  - Main custom bottom navigation widget.
- `lib/features/main/presentation/widgets/my_bottom_nav/button_nav_item.dart`
  - Reusable navigation tab item.
- `lib/features/main/presentation/widgets/my_bottom_nav/add_event_button.dart`
  - Floating circular glass add button.
- `lib/features/main/presentation/widgets/my_bottom_nav/interactive_glow_surface.dart`
  - Custom interaction layer that draws a moving glow based on pointer position.

### Tabs

- `lib/features/main/presentation/widgets/tabs/home_tab.dart`
- `lib/features/main/presentation/widgets/tabs/messages_tab.dart`
- `lib/features/main/presentation/widgets/tabs/calendar_tab.dart`
- `lib/features/main/presentation/widgets/tabs/profile_tab.dart`

These are the four screens shown by the navigation bar.

## Short Project Summary 🚀

This project demonstrates how to build a fully custom bottom navigation experience in Flutter using:

- glassmorphism
- soft shadows
- elastic interaction
- animated selected states
- pointer-based glow effects

It is a UI-focused example that combines state management with premium visual feedback.

## Where `MyBottomNavigationBar` Lives 📍

`MyBottomNavigationBar` is used inside `MainScreen` as the `bottomNavigationBar` of the `Scaffold`.

```text
MainScreen
└── Scaffold
    ├── body: IndexedStack(...)
    └── bottomNavigationBar: MyBottomNavigationBar()
```

This means:

- `MainScreen` controls which page is visible
- `MyBottomNavigationBar` controls which tab is selected
- `MainBloc` connects both of them together

## Full Widget Tree of `MyBottomNavigationBar` 🌊

```text
MyBottomNavigationBar
└── Padding(bottom: 16)
    └── SizedBox(height: 80)
        └── Padding(horizontal: 16)
            └── BlocBuilder<MainBloc, MainState>
                └── Row
                    ├── Expanded
                    │   └── PhysicalModel
                    │       └── LiquidGlassLayer
                    │           └── LiquidStretch
                    │               └── ClipRRect
                    │                   └── SizedBox(height: 80)
                    │                       └── Center
                    │                           └── LiquidStretch
                    │                               └── InteractiveGlowSurface
                    │                                   └── LiquidGlass
                    │                                       └── Container(height: 65)
                    │                                           └── Row
                    │                                               ├── BottonNavItem(Home)
                    │                                               ├── BottonNavItem(Messages)
                    │                                               ├── BottonNavItem(Calendar)
                    │                                               └── BottonNavItem(Profile)
                    ├── SizedBox(width: 12)
                    └── PhysicalModel
                        └── LiquidGlassLayer
                            └── AddEventButton(size: 60)
```

## Full Explanation: From Parent to Deepest Child 🧠

### 1. `MyBottomNavigationBar`

This is the root widget of the whole custom navigation bar.

Its job is to:

- build the entire bottom navigation layout
- connect the UI to `MainBloc`
- detect which item is selected
- render the main glass bar and the add button

### 2. `Padding(bottom: 16)`

Adds space below the bar so it feels like a floating component instead of being attached directly to the bottom edge of the screen.

### 3. `SizedBox(height: 80)`

Defines the total vertical space used by the bottom navigation area.

### 4. `Padding(horizontal: 16)`

Adds left and right spacing so the bar does not touch the screen edges.

### 5. `BlocBuilder<MainBloc, MainState>`

This widget listens to `MainBloc` state changes and rebuilds the navigation bar when the selected tab changes.

Why it matters:

- when a user taps an item, a `ChangeTabEvent` is dispatched
- `MainBloc` updates `currentIndex`
- the navigation UI rebuilds
- the selected item becomes highlighted

### 6. `Row`

Splits the bottom area into two parts:

- the main navigation glass bar
- the circular add button

## Left Side: Main Navigation Bar 🧊

### 7. `Expanded`

Makes the main navigation bar take all remaining horizontal space inside the `Row`.

### 8. `PhysicalModel`

Adds depth and shadow around the bar.

Its role is visual:

- transparent surface
- rounded corners
- soft shadow
- elevated floating feel

This is one of the reasons the component feels premium rather than flat.

## Liquid Glass Widgets Explained 💎

These widgets are the visual core of the project.

### 9. `LiquidGlassLayer`

This widget provides the glass rendering environment for its children.

It applies shared glass settings such as:

- `blur`
- `thickness`
- `glassColor`
- `lightIntensity`
- `ambientStrength`
- `saturation`

In simple words:

It creates the outer glass context that other liquid-glass widgets can render inside.

### 10. `LiquidStretch`

This widget adds elastic motion and a soft fluid response during interaction.

Why it is used:

- to make the bar feel reactive
- to avoid rigid, static motion
- to simulate a more organic glass surface

In this project, the main bar uses more than one `LiquidStretch` layer to make the final movement feel richer and smoother.

In simple words:

It makes the glass feel flexible and alive.

### 11. `ClipRRect`

Clips the content using rounded corners.

This is important because:

- the glow should stay inside the bar
- the stretch effect should not overflow outside the shape
- the glass surface should remain visually clean

### 12. `SizedBox(height: 80)` and `Center`

These widgets help align the inner content nicely inside the outer navigation bar area.

They keep the visual layout balanced and vertically centered.

### 13. Second `LiquidStretch`

This is another interaction layer inside the main bar.

Its purpose is to:

- intensify the fluid feel
- create a more polished interactive response
- make the inner surface feel softer

### 14. `InteractiveGlowSurface`

This is a custom widget made specifically for this project.

Its purpose is to:

- track pointer or touch position
- paint a glow that follows user interaction
- add a premium interactive highlight over the glass surface

It is one of the most important custom pieces in the design.

### Internal tree of `InteractiveGlowSurface`

```text
InteractiveGlowSurface
└── LayoutBuilder
    └── ClipRRect
        └── Stack
            ├── Listener
            │   └── child
            └── Positioned.fill
                └── IgnorePointer
                    └── AnimatedOpacity
                        └── AnimatedContainer
                            └── RadialGradient
```

### How `InteractiveGlowSurface` works ✨

- `LayoutBuilder`
  - reads the actual size of the widget
- `Listener`
  - listens to pointer down, move, up, and cancel events
- `Stack`
  - places the real child below and the glow layer above it
- `AnimatedOpacity`
  - fades the glow in and out smoothly
- `AnimatedContainer`
  - animates the glow updates
- `RadialGradient`
  - draws the glow around the current touch position
- `IgnorePointer`
  - prevents the glow layer from blocking taps

In simple words:

This widget creates the moving light effect that follows the user interaction.

### 15. `LiquidGlass`

This is the actual visible glass panel.

It renders the frosted liquid-glass surface using:

- blur
- transparency
- lighting
- a smooth rounded shape

The shape used here is:

- `LiquidRoundedSuperellipse`

Why that matters:

- it looks softer than a standard rounded rectangle
- it gives the bar a more modern and premium look

In simple words:

This is the main glass body of the navigation bar.

### 16. `Container(height: 65, padding: horizontal 8)`

This is the inner content area of the glass bar.

Its job is to:

- define the effective height of the inner bar
- add side padding
- hold the row of navigation items

### 17. Inner `Row`

Places the four navigation items horizontally:

- Home
- Messages
- Calendar
- Profile

## `BottonNavItem` Explained 🎯

Each tab inside the bar is built using `BottonNavItem`.

### Tree of one navigation item

```text
BottonNavItem
└── Expanded
    └── Material
        └── InkWell
            └── Padding(vertical: 8)
                └── Column
                    ├── Container(36x36)
                    │   └── SvgPicture.asset(...)
                    ├── SizedBox(height: 6)
                    └── AnimatedContainer(...)
```

### Purpose of each widget inside `BottonNavItem`

#### `Expanded`

Makes every tab item take equal width so all items stay evenly distributed.

#### `Material`

Provides the material layer required for `InkWell` to behave correctly.

#### `InkWell`

Handles the tap interaction.

When tapped:

- it triggers `onPressed`
- `onPressed` dispatches `ChangeTabEvent(index)`

#### `Padding(vertical: 8)`

Adds vertical breathing space around the content.

#### `Column`

Stacks the icon and the bottom indicator vertically.

#### `Container(36x36)`

Wraps the icon and shows a soft selected background when the item is active.

If the item is selected:

- background becomes softly tinted with `BASE_COLOR`

If not selected:

- background stays transparent

#### `SvgPicture.asset`

Displays the SVG icon.

The icon color changes depending on selection state:

- selected: `BASE_COLOR`
- not selected: `BLACK`

#### `AnimatedContainer`

This is the small bottom indicator line.

If selected:

- width becomes `18`

If not selected:

- width becomes `0`

Because it is animated, the indicator appears and disappears smoothly.

## Right Side: Add Button ➕

### 18. `SizedBox(width: 12)`

Adds horizontal spacing between the main glass bar and the circular add button.

### 19. `PhysicalModel`

Gives the add button the same elevated floating shadow style used by the main bar.

### 20. `AddEventButton`

This is the custom circular button displayed on the right side.

### Tree of `AddEventButton`

```text
AddEventButton
└── LiquidStretch
    └── InteractiveGlowSurface
        └── LiquidGlass
            └── Material
                └── InkWell
                    └── SizedBox
                        └── GlassGlow
                            └── Icon(Icons.add)
```

### Purpose of each widget inside `AddEventButton`

#### `LiquidStretch`

Adds a soft elastic response when the button is interacted with.

#### `InteractiveGlowSurface`

Adds a pointer-following glow around the button surface.

#### `LiquidGlass`

Builds the circular glass body of the button.

#### `Material`

Supports touch interaction correctly.

#### `InkWell`

Makes the button tappable.

Note:

- the current `onTap` is empty
- the button is visually complete, but it does not perform an action yet

#### `SizedBox`

Sets the button width and height.

#### `GlassGlow`

Adds a stronger glow around the plus icon.

This gives the button extra emphasis and helps it stand out as an action button.

#### `Icon(Icons.add)`

The visible plus icon shown at the center of the button.

## State Flow 🔄

This is how navigation state moves through the app:

```text
User taps BottonNavItem
→ onPressed runs
→ ChangeTabEvent(index) is sent to MainBloc
→ MainBloc emits a new MainState
→ currentIndex changes
→ MainScreen rebuilds
→ IndexedStack shows the selected tab
→ MyBottomNavigationBar rebuilds
→ selected item style updates
```

## Why This Design Feels Modern 🎨

- Glass blur adds depth
- Soft shadows create a floating effect
- Stretch effects make the UI feel fluid
- Glow effects make touch interaction feel premium
- Superellipse corners look softer than standard rectangles
- Animated states make the interface feel alive

## Tabs and Navigation Mapping 🧭

The navigation bar controls these four tabs:

- `0` → `HomeTab`
- `1` → `MessagesTab`
- `2` → `CalendarTab`
- `3` → `ProfileTab`

The body uses `IndexedStack`, which means:

- only one tab is shown at a time
- the other tabs remain in the widget tree
- internal state can be preserved while switching

## Final Summary 📝

This project is a Flutter UI experiment focused on building a custom bottom navigation bar with a liquid-glass identity.

It combines:

- reusable widgets
- layered visual effects
- custom interaction feedback
- BLoC-based state management

The result is a navigation experience that feels modern, polished, and expressive. ✨
