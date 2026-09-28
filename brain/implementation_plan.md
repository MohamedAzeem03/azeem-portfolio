# Transform Projects Section into Scroll-Driven Stacked Cards

I will completely revamp your Projects section to perfectly match the premium, scroll-driven, stacked-card experience shown in your reference image, while strictly preserving your existing project data, case study functionality, and the architecture of the rest of your portfolio.

## User Review Required
Please review the proposed architectural approach and the open question below. 

> [!IMPORTANT]
> **Open Question:** I inspected your `assets/images/` directory and noticed that the actual screenshots for your projects (e.g., Devora, Your Friendeey, etc.) do not currently exist in the codebase. 
> 
> Should I use placeholder colored boxes for the project images for now, or would you like to provide the image files first? (If placeholders are fine, I will proceed and you can easily drop your images in later).

## Proposed Changes

### 1. Scroll Architecture & Stacking Engine
Since your portfolio uses a global `SingleChildScrollView` in `home_page.dart`, native "sticky" positioning isn't possible without rewriting the entire app's scroll view. To strictly follow your rule of **not modifying other sections**, I have designed a highly performant mathematical scrolling engine contained entirely within `ProjectsSection`:
- `ProjectsSection` will be converted to a `StatefulWidget`.
- It will track the global `ScrollPosition` and calculate its exact Y-offset relative to the viewport.
- It will use a `Stack` sized to `viewportHeight * number_of_projects`.
- As the user scrolls, `Transform.translate` will be used to perfectly counteract the parent scroll, creating a flawless "pinned" effect for the active card.
- Subsequent cards will slide up naturally and "dock" over the previous cards with a 40px top offset to create the stacked visual.
- Background cards will slightly scale down (`0.95x`) and dim slightly to create a cinematic 3D depth effect as new cards stack over them.

### 2. UI & Visual Design Refactoring
I will redesign the inner content of the project cards to exactly match the white 4-state reference image:
- **Heading**: Large "SELECTED PROJECTS" with ample whitespace.
- **Card Styling**: Clean white background, subtle light-gray borders, rounded corners, and soft shadows.
- **Hierarchy**: Large numbers (`01`, `02`) on the far left.
- **Typography**: Crisp black text for titles, gray for the tech tags and descriptions.
- **Key Work Section**: A horizontal divider followed by the bulleted list of key outcomes.
- **Button**: The sleek black "VIEW CASE STUDY →" pill button, preserving the exact `showDialog` logic currently in place.

### 3. Responsive Design
- **Desktop**: Horizontal layout with Number -> Details -> Image.
- **Mobile**: Vertical stacked layout (Number -> Title -> Description -> Tech -> Image -> Button -> Key Work), preventing any horizontal overflow while maintaining the scroll-stacking physics.

## Verification Plan
1. Ensure `home_page.dart` remains completely untouched.
2. Verify the mathematical pinning engine locks cards seamlessly at the top of the viewport without jitter.
3. Verify the Case Study modals open correctly with the existing data.
4. Verify mobile layouts wrap correctly without overflowing.
