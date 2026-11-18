# Project Plan: "Blazing Aurora Tesla" - UI/UX Transformation & System Optimization

## 1. Project Overview
**Objective:** Transform the `ysyplat` (User Center) and `cart` (Shopping Cart) modules from their current state into a high-end, unified, and highly interactive "Apple-style" experience. The new design will leverage **Bento Grid** layouts, **Liquid Glass** (Glassmorphism) aesthetics, and a **Tencent Blue** accent color, while implementing a "Microsoft-style" multi-step authentication flow.

**Core Design Philosophy:**
- **Aesthetic:** Apple WWDC 2025 (Bento Grid, High Contrast, Large Typography, Glassmorphism).
- **Interactivity:** Smooth, non-bloated, "Liquid" transitions (Microsoft-style auth).
- **Responsiveness:** Desktop (1920px+) focus with a Mobile App-style Bottom Navigation bar.
- **Brand Identity:** Tencent Blue accents, clean White/Light base, high-end professional feel.

---

## 2. Technical Stack & Design System

### 2.1 Visual Design Tokens (TailwindCSS & CSS)
- **Glassmorphism (Liquid Glass):**
    - `wrapper`: `backdrop-filter: blur(12px);` + `background: rgba(255, 255, 255, 0.25);`
    - `effect`: `filter: url(#glass-distortion);` (SVG filter for organic feel)
    - `shine`: `box-shadow: inset 2px 2px 1px rgba(255, 255, 255, 0.5);`
    - `tint`: `background: rgba(255, 255, 255, 0.25);`
- **Color Palette:**
    - **Primary:** Tencent Blue (`#0052D9` or similar) for buttons, highlights, and active states.
    - **Text:** High contrast (Black for sidebars, White for dark/glass overlays).
    - **Background:** `/upload/back.webp` (Global background image).
- **Typography:**
    - **Headings:** Sans-serif (Inter/Noto Sans SC), Bold/Extra-Bold (Large scale).
    - **Accent:** Small uppercase English labels for a professional "tech" look.

### 2.2 Component Architecture
- **Bento Card:** A responsive grid container using CSS Grid/Flexbox with varying item spans.
- **App-Style Bottom Nav:** A fixed-bottom menu for mobile devices (`md:hidden`).
- **Multi-Step Container:** A state-driven JS component that manages "steps" (User $\rightarrow$ Password $\rightarrow$ Success) using CSS transitions.

---

## 3. Detailed Implementation Phases

### Phase 1: Infrastructure & Asset Audit (Discovery)
*Goal: Fix the "Broken Foundation" (404s & CSS issues).*
- **[Critical] Asset Path Restoration:** 
    - Scan all `.tpl` files for 404 errors in `configure.css`, `icons.min.css`, `bootstrap-select.min.css`, `ion.rangeSlider.min.css`, and `cart.css`.
    - Map existing assets in `ysyplat/assets` and `cart/assets`.
    - Standardize all paths to use absolute roots from the project base to prevent relative path breakage.
- **[Critical] CSS/JS Normalization:**
    - Re-implement/Fix `bootstrap-select` and `ion.rangeSlider` to ensure they work within the glassmorphic layout.
    - Resolve the "Black Popup" Bug by explicitly setting background/text colors for all modal/dialog components.
- **[Critical] Geetest 4.0 Setup:**
    - Create `config/geetest_config.json` (or similar) to store `captcha_id` and `captcha_secret`.
    - Ensure the logic is decoupled from the core auth engine.

### Phase 2: The "Unified Liquid" Design System (Design)
*Goal: Build the "Soul" of the UI.*
- **Global Layout Engine:**
    - **Desktop Side/Top Nav:** Implement "Floating" menus (no edge-to-edge). They must appear as "islands" on top of the background.
    - **Mobile Navigation:** Implement a `fixed bottom-0` bar for mobile viewports.
    - **Footer:** Standardized ICP/Copyright footer with `backdrop-filter` and responsive sizing.
- **Component Library:**
    - Build the `liquidGlass-wrapper` pattern as a reusable CSS utility.
    - Design the "Bento" grid system for dashboard widgets (ECharts, statistics, etc.).

### Phase 3: Authentication & Core Workflows (Implementation)
*Goal: The "Microsoft-style" Experience.*
- **Unified Auth Flow (Login, Register, Password Reset):**
    - **Step 1:** Input User Identity (Username/Email/Phone) $\rightarrow$ `transition: slide-out`.
    - **Step 2:** Input Credentials (Password/OTP) $\rightarrow$ `transition: slide-in`.
    - **Step 3:** Success/Action Completion.
- **Login Page Redesign:**
    - Center-aligned "Floating Glass" container.
    - Large, high-quality background imagery.
    - Implemented "Transition Animations" between authentication steps.
- **Registration & Third-Party Binding:**
    - Complete restructuring to match the Login UI (Bento-style inputs, glass containers).

### Phase 4: Shopping Cart & User Center Optimization (Implementation)
*Goal: Functionality meets Beauty.*
- **Shopping Cart Overhaul:**
    - **Navigation:** Floating top/side menu.
    - **Product Selection:** Fix the "immediate purchase" (立即订购) visibility issue; ensure all options/sliders are high-contrast.
    - **Product Config Page:** Fix the 404 error for `configureproduct.tpl`. Ensure all radio buttons and selection boxes are clearly visible (White/Tencent Blue).
    - **Checkout Flow:** Ensure "Confirm Order" is present and functional.
- **User Center Optimization:**
    - **Dashboard (Home):** Use Bento Grid for user stats and service shortcuts.
    - **Product Management:** Fix the "transparent text" issue. All management tables/lists must have high-contrast text on a clean glass background.
    - **Modals/Popups:** Ensure all user-facing popups are "White Glass" (not black) and have high legendibility.

### Phase 5: Testing, Polish & Final Delivery (QA)
*Goal: Zero-Defect Launch.*
- **Cross-Resolution Test:** Validate at 1920px, 1440px, 1280px, and Mobile (375px).
- **Performance Audit:** Ensure the "Liquid Glass" (blur/distortion) doesn't cause excessive GPU lag on mobile.
- **Accessibility Check:** Ensure color contrast ratios meet standards (Text vs. Background).

---

## 4. Critical Files to Modify/Create
- `config/geetest_config.json` (New)
- `assets/css/global-glass.css` (New - The core design system)
- `ysyplat/templates/auth/login_steps.tpl` (New/Refactored)
- `cart/templates/cart_main.tpl` (Refactored)
- `ysyplat/templates/user_dashboard.tpl` (Refactored)
- `ysyplat/templates/product_config.tpl` (Refactored - Fixing 404s)
- All existing `.tpl` files in `ysyplat` and `cart` for CSS/Path alignment.

---
*Plan generated for the "Blazing Aurora Tesla" project. Prepared for execution once approved.*
