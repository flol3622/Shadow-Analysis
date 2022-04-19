require 'date'
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection
view = mod.active_view
html = "
<html>
<head>
  <title>Settings</title>
  <style>
    /*!
      * Pico.css v1.5.0 (https://picocss.com)
      * Copyright 2019-2022 - Licensed under MIT
      *
      * Slim version example
      * You can export only the modules you need
      */
    :root {
      --font-family: system-ui, -apple-system, 'Segoe UI', 'Roboto', 'Ubuntu',
        'Cantarell', 'Noto Sans', sans-serif, 'Apple Color Emoji',
        'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
      --line-height: 1.2;
      --font-weight: 400;
      --font-size: 14px;
      --border-radius: 0.4rem;
      --border-width: 1px;
      --outline-width: 3px;
      --spacing: 0.3rem;
      --typography-spacing-vertical: 1.5rem;
      --block-spacing-vertical: calc(var(--spacing) * 2);
      --block-spacing-horizontal: var(--spacing);
      --grid-spacing-vertical: 0;
      --grid-spacing-horizontal: var(--spacing);
      --form-element-spacing-vertical: 0.75rem;
      --form-element-spacing-horizontal: 1rem;
      --nav-element-spacing-vertical: 1rem;
      --nav-element-spacing-horizontal: 0.5rem;
      --nav-link-spacing-vertical: 0.5rem;
      --nav-link-spacing-horizontal: 0.5rem;
      --form-label-font-weight: var(--font-weight);
      --transition: 0.2s ease-in-out;
    }

    @media (min-width: 576px) {
      :root {
        --font-size: 17px;
      }
    }

    @media (min-width: 768px) {
      :root {
        --font-size: 18px;
      }
    }

    @media (min-width: 992px) {
      :root {
        --font-size: 19px;
      }
    }

    @media (min-width: 1200px) {
      :root {
        --font-size: 20px;
      }
    }

    a {
      --text-decoration: none;
    }

    a.contrast,
    a.secondary {
      --text-decoration: underline;
    }

    small {
      --font-size: 0.875em;
    }

    h1,
    h2,
    h3,
    h4,
    h5,
    h6 {
      --font-weight: 700;
    }

    h1 {
      --font-size: 2rem;
      --typography-spacing-vertical: 3rem;
    }

    h2 {
      --font-size: 1.75rem;
      --typography-spacing-vertical: 2.625rem;
    }

    h3 {
      --font-size: 1.5rem;
      --typography-spacing-vertical: 2.25rem;
    }

    h4 {
      --font-size: 1.25rem;
      --typography-spacing-vertical: 1.874rem;
    }

    h5 {
      --font-size: 1.125rem;
      --typography-spacing-vertical: 1.6875rem;
    }

    [type='checkbox'],
    [type='radio'] {
      --border-width: 2px;
    }

    [type='checkbox'][role='switch'] {
      --border-width: 3px;
    }

    tfoot td,
    tfoot th,
    thead td,
    thead th {
      --border-width: 3px;
    }

    :not(thead):not(tfoot)>*>td {
      --font-size: 0.875em;
    }

    code,
    kbd,
    pre,
    samp {
      --font-family: 'Menlo', 'Consolas', 'Roboto Mono', 'Ubuntu Monospace',
        'Noto Mono', 'Oxygen Mono', 'Liberation Mono', monospace,
        'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol',
        'Noto Color Emoji';
    }

    kbd {
      --font-weight: bolder;
    }

    :root:not([data-theme='dark']),
    [data-theme='light'] {
      color-scheme: light;
      --background-color: #fff;
      --color: #415462;
      --h1-color: #1b2832;
      --h2-color: #24333e;
      --h3-color: #2c3d49;
      --h4-color: #374956;
      --h5-color: #415462;
      --h6-color: #4d606d;
      --muted-color: #73828c;
      --muted-border-color: #edf0f3;
      --primary: #1095c1;
      --primary-hover: #08769b;
      --primary-focus: rgba(16, 149, 193, 0.125);
      --primary-inverse: #fff;
      --secondary: #596b78;
      --secondary-hover: #415462;
      --secondary-focus: rgba(89, 107, 120, 0.125);
      --secondary-inverse: #fff;
      --contrast: #1b2832;
      --contrast-hover: #000;
      --contrast-focus: rgba(89, 107, 120, 0.125);
      --contrast-inverse: #fff;
      --mark-background-color: #fff2ca;
      --mark-color: #543a26;
      --ins-color: #388e3c;
      --del-color: #c62828;
      --blockquote-border-color: var(--muted-border-color);
      --blockquote-footer-color: var(--muted-color);
      --button-box-shadow: 0 0 0 rgba(0, 0, 0, 0);
      --button-hover-box-shadow: 0 0 0 rgba(0, 0, 0, 0);
      --form-element-background-color: transparent;
      --form-element-border-color: #a2afb9;
      --form-element-color: var(--color);
      --form-element-placeholder-color: var(--muted-color);
      --form-element-active-background-color: transparent;
      --form-element-active-border-color: var(--primary);
      --form-element-focus-color: var(--primary-focus);
      --form-element-disabled-background-color: #d5dce2;
      --form-element-disabled-border-color: #a2afb9;
      --form-element-disabled-opacity: 0.5;
      --form-element-invalid-border-color: #c62828;
      --form-element-invalid-active-border-color: #d32f2f;
      --form-element-invalid-focus-color: rgba(211, 47, 47, 0.125);
      --form-element-valid-border-color: #388e3c;
      --form-element-valid-active-border-color: #43a047;
      --form-element-valid-focus-color: rgba(67, 160, 71, 0.125);
      --switch-background-color: #bbc6ce;
      --switch-color: var(--primary-inverse);
      --switch-checked-background-color: var(--primary);
      --range-border-color: #d5dce2;
      --range-active-border-color: #bbc6ce;
      --range-thumb-border-color: var(--background-color);
      --range-thumb-color: var(--secondary);
      --range-thumb-hover-color: var(--secondary-hover);
      --range-thumb-active-color: var(--primary);
      --table-border-color: var(--muted-border-color);
      --table-row-stripped-background-color: #f6f8f9;
      --code-background-color: #edf0f3;
      --code-color: var(--muted-color);
      --code-kbd-background-color: var(--contrast);
      --code-kbd-color: var(--contrast-inverse);
      --code-tag-color: #b34d80;
      --code-property-color: #3d888f;
      --code-value-color: #998866;
      --code-comment-color: #a2afb9;
      --accordion-border-color: var(--muted-border-color);
      --accordion-close-summary-color: var(--color);
      --accordion-open-summary-color: var(--muted-color);
      --card-background-color: var(--background-color);
      --card-border-color: var(--muted-border-color);
      --card-box-shadow: 0 0.125rem 1rem rgba(27, 40, 50, 0.04),
        0 0.125rem 2rem rgba(27, 40, 50, 0.08),
        0 0 0 0.0625rem rgba(27, 40, 50, 0.024);
      --card-sectionning-background-color: #fbfbfc;
      --dropdown-background-color: #fbfbfc;
      --dropdown-border-color: #e1e6eb;
      --dropdown-box-shadow: var(--card-box-shadow);
      --dropdown-color: var(--color);
      --dropdown-hover-background-color: #edf0f3;
      --modal-overlay-background-color: rgba(213, 220, 226, 0.8);
      --progress-background-color: #d5dce2;
      --progress-color: var(--primary);
      --loading-spinner-opacity: 0.5;
      --tooltip-background-color: var(--contrast);
      --tooltip-color: var(--contrast-inverse);
      --icon-checkbox: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23FFF' stroke-width='4' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='20 6 9 17 4 12'%3E%3C/polyline%3E%3C/svg%3E');
      --icon-chevron: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(65, 84, 98, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E');
      --icon-chevron-button: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(255, 255, 255, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E');
      --icon-chevron-button-inverse: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(255, 255, 255, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E');
      --icon-close: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(115, 130, 140, 0.999)' stroke-width='4' stroke-linecap='round' stroke-linejoin='round'%3E%3Cline x1='18' y1='6' x2='6' y2='18'%3E%3C/line%3E%3Cline x1='6' y1='6' x2='18' y2='18'%3E%3C/line%3E%3C/svg%3E');
      --icon-date: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(65, 84, 98, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Crect x='3' y='4' width='18' height='18' rx='2' ry='2'%3E%3C/rect%3E%3Cline x1='16' y1='2' x2='16' y2='6'%3E%3C/line%3E%3Cline x1='8' y1='2' x2='8' y2='6'%3E%3C/line%3E%3Cline x1='3' y1='10' x2='21' y2='10'%3E%3C/line%3E%3C/svg%3E');
      --icon-invalid: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(198, 40, 40, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='12' cy='12' r='10'%3E%3C/circle%3E%3Cline x1='12' y1='8' x2='12' y2='12'%3E%3C/line%3E%3Cline x1='12' y1='16' x2='12.01' y2='16'%3E%3C/line%3E%3C/svg%3E');
      --icon-minus: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23FFF' stroke-width='4' stroke-linecap='round' stroke-linejoin='round'%3E%3Cline x1='5' y1='12' x2='19' y2='12'%3E%3C/line%3E%3C/svg%3E');
      --icon-search: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(65, 84, 98, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='11' cy='11' r='8'%3E%3C/circle%3E%3Cline x1='21' y1='21' x2='16.65' y2='16.65'%3E%3C/line%3E%3C/svg%3E');
      --icon-time: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(65, 84, 98, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='12' cy='12' r='10'%3E%3C/circle%3E%3Cpolyline points='12 6 12 12 16 14'%3E%3C/polyline%3E%3C/svg%3E');
      --icon-valid: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(56, 142, 60, 0.999)' stroke-width='3' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='20 6 9 17 4 12'%3E%3C/polyline%3E%3C/svg%3E');
    }

    @media only screen and (prefers-color-scheme: dark) {
      :root:not([data-theme='light']) {
        color-scheme: dark;
        --background-color: #11191f;
        --color: #bbc6ce;
        --h1-color: #edf0f3;
        --h2-color: #e1e6eb;
        --h3-color: #d5dce2;
        --h4-color: #c8d1d8;
        --h5-color: #bbc6ce;
        --h6-color: #afbbc4;
        --muted-color: #73828c;
        --muted-border-color: #1f2d38;
        --primary: #1095c1;
        --primary-hover: #1ab3e6;
        --primary-focus: rgba(16, 149, 193, 0.25);
        --primary-inverse: #fff;
        --secondary: #596b78;
        --secondary-hover: #73828c;
        --secondary-focus: rgba(115, 130, 140, 0.25);
        --secondary-inverse: #fff;
        --contrast: #edf0f3;
        --contrast-hover: #fff;
        --contrast-focus: rgba(115, 130, 140, 0.25);
        --contrast-inverse: #000;
        --mark-background-color: #d1c284;
        --mark-color: #11191f;
        --ins-color: #388e3c;
        --del-color: #c62828;
        --blockquote-border-color: var(--muted-border-color);
        --blockquote-footer-color: var(--muted-color);
        --button-box-shadow: 0 0 0 rgba(0, 0, 0, 0);
        --button-hover-box-shadow: 0 0 0 rgba(0, 0, 0, 0);
        --form-element-background-color: #11191f;
        --form-element-border-color: #374956;
        --form-element-color: var(--color);
        --form-element-placeholder-color: var(--muted-color);
        --form-element-active-background-color: var(--form-element-background-color);
        --form-element-active-border-color: var(--primary);
        --form-element-focus-color: var(--primary-focus);
        --form-element-disabled-background-color: #2c3d49;
        --form-element-disabled-border-color: #415462;
        --form-element-disabled-opacity: 0.5;
        --form-element-invalid-border-color: #b71c1c;
        --form-element-invalid-active-border-color: #c62828;
        --form-element-invalid-focus-color: rgba(198, 40, 40, 0.25);
        --form-element-valid-border-color: #2e7d32;
        --form-element-valid-active-border-color: #388e3c;
        --form-element-valid-focus-color: rgba(56, 142, 60, 0.25);
        --switch-background-color: #374956;
        --switch-color: var(--primary-inverse);
        --switch-checked-background-color: var(--primary);
        --range-border-color: #24333e;
        --range-active-border-color: #2c3d49;
        --range-thumb-border-color: var(--background-color);
        --range-thumb-color: var(--secondary);
        --range-thumb-hover-color: var(--secondary-hover);
        --range-thumb-active-color: var(--primary);
        --table-border-color: var(--muted-border-color);
        --table-row-stripped-background-color: rgba(115, 130, 140, 0.05);
        --code-background-color: #18232c;
        --code-color: var(--muted-color);
        --code-kbd-background-color: var(--contrast);
        --code-kbd-color: var(--contrast-inverse);
        --code-tag-color: #a65980;
        --code-property-color: #599fa6;
        --code-value-color: #8c8473;
        --code-comment-color: #4d606d;
        --accordion-border-color: var(--muted-border-color);
        --accordion-active-summary-color: var(--primary);
        --accordion-close-summary-color: var(--color);
        --accordion-open-summary-color: var(--muted-color);
        --card-background-color: #141e26;
        --card-border-color: #11191f;
        --card-box-shadow: 0 0.125rem 1rem rgba(0, 0, 0, 0.06),
          0 0.125rem 2rem rgba(0, 0, 0, 0.12),
          0 0 0 0.0625rem rgba(0, 0, 0, 0.036);
        --card-sectionning-background-color: #18232c;
        --dropdown-background-color: #1b2832;
        --dropdown-border-color: #24333e;
        --dropdown-box-shadow: var(--card-box-shadow);
        --dropdown-color: var(--color);
        --dropdown-hover-background-color: rgba(36, 51, 62, 0.75);
        --modal-overlay-background-color: rgba(36, 51, 62, 0.9);
        --progress-background-color: #24333e;
        --progress-color: var(--primary);
        --loading-spinner-opacity: 0.5;
        --tooltip-background-color: var(--contrast);
        --tooltip-color: var(--contrast-inverse);
        --icon-checkbox: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23FFF' stroke-width='4' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='20 6 9 17 4 12'%3E%3C/polyline%3E%3C/svg%3E');
        --icon-chevron: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(162, 175, 185, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E');
        --icon-chevron-button: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(255, 255, 255, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E');
        --icon-chevron-button-inverse: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(0, 0, 0, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E');
        --icon-close: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(115, 130, 140, 0.999)' stroke-width='4' stroke-linecap='round' stroke-linejoin='round'%3E%3Cline x1='18' y1='6' x2='6' y2='18'%3E%3C/line%3E%3Cline x1='6' y1='6' x2='18' y2='18'%3E%3C/line%3E%3C/svg%3E');
        --icon-date: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(162, 175, 185, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Crect x='3' y='4' width='18' height='18' rx='2' ry='2'%3E%3C/rect%3E%3Cline x1='16' y1='2' x2='16' y2='6'%3E%3C/line%3E%3Cline x1='8' y1='2' x2='8' y2='6'%3E%3C/line%3E%3Cline x1='3' y1='10' x2='21' y2='10'%3E%3C/line%3E%3C/svg%3E');
        --icon-invalid: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(183, 28, 28, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='12' cy='12' r='10'%3E%3C/circle%3E%3Cline x1='12' y1='8' x2='12' y2='12'%3E%3C/line%3E%3Cline x1='12' y1='16' x2='12.01' y2='16'%3E%3C/line%3E%3C/svg%3E');
        --icon-minus: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23FFF' stroke-width='4' stroke-linecap='round' stroke-linejoin='round'%3E%3Cline x1='5' y1='12' x2='19' y2='12'%3E%3C/line%3E%3C/svg%3E');
        --icon-search: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(162, 175, 185, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='11' cy='11' r='8'%3E%3C/circle%3E%3Cline x1='21' y1='21' x2='16.65' y2='16.65'%3E%3C/line%3E%3C/svg%3E');
        --icon-time: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(162, 175, 185, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='12' cy='12' r='10'%3E%3C/circle%3E%3Cpolyline points='12 6 12 12 16 14'%3E%3C/polyline%3E%3C/svg%3E');
        --icon-valid: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(46, 125, 50, 0.999)' stroke-width='3' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='20 6 9 17 4 12'%3E%3C/polyline%3E%3C/svg%3E');
      }
    }

    [data-theme='dark'] {
      color-scheme: dark;
      --background-color: #11191f;
      --color: #bbc6ce;
      --h1-color: #edf0f3;
      --h2-color: #e1e6eb;
      --h3-color: #d5dce2;
      --h4-color: #c8d1d8;
      --h5-color: #bbc6ce;
      --h6-color: #afbbc4;
      --muted-color: #73828c;
      --muted-border-color: #1f2d38;
      --primary: #1095c1;
      --primary-hover: #1ab3e6;
      --primary-focus: rgba(16, 149, 193, 0.25);
      --primary-inverse: #fff;
      --secondary: #596b78;
      --secondary-hover: #73828c;
      --secondary-focus: rgba(115, 130, 140, 0.25);
      --secondary-inverse: #fff;
      --contrast: #edf0f3;
      --contrast-hover: #fff;
      --contrast-focus: rgba(115, 130, 140, 0.25);
      --contrast-inverse: #000;
      --mark-background-color: #d1c284;
      --mark-color: #11191f;
      --ins-color: #388e3c;
      --del-color: #c62828;
      --blockquote-border-color: var(--muted-border-color);
      --blockquote-footer-color: var(--muted-color);
      --button-box-shadow: 0 0 0 rgba(0, 0, 0, 0);
      --button-hover-box-shadow: 0 0 0 rgba(0, 0, 0, 0);
      --form-element-background-color: #11191f;
      --form-element-border-color: #374956;
      --form-element-color: var(--color);
      --form-element-placeholder-color: var(--muted-color);
      --form-element-active-background-color: var(--form-element-background-color);
      --form-element-active-border-color: var(--primary);
      --form-element-focus-color: var(--primary-focus);
      --form-element-disabled-background-color: #2c3d49;
      --form-element-disabled-border-color: #415462;
      --form-element-disabled-opacity: 0.5;
      --form-element-invalid-border-color: #b71c1c;
      --form-element-invalid-active-border-color: #c62828;
      --form-element-invalid-focus-color: rgba(198, 40, 40, 0.25);
      --form-element-valid-border-color: #2e7d32;
      --form-element-valid-active-border-color: #388e3c;
      --form-element-valid-focus-color: rgba(56, 142, 60, 0.25);
      --switch-background-color: #374956;
      --switch-color: var(--primary-inverse);
      --switch-checked-background-color: var(--primary);
      --range-border-color: #24333e;
      --range-active-border-color: #2c3d49;
      --range-thumb-border-color: var(--background-color);
      --range-thumb-color: var(--secondary);
      --range-thumb-hover-color: var(--secondary-hover);
      --range-thumb-active-color: var(--primary);
      --table-border-color: var(--muted-border-color);
      --table-row-stripped-background-color: rgba(115, 130, 140, 0.05);
      --code-background-color: #18232c;
      --code-color: var(--muted-color);
      --code-kbd-background-color: var(--contrast);
      --code-kbd-color: var(--contrast-inverse);
      --code-tag-color: #a65980;
      --code-property-color: #599fa6;
      --code-value-color: #8c8473;
      --code-comment-color: #4d606d;
      --accordion-border-color: var(--muted-border-color);
      --accordion-active-summary-color: var(--primary);
      --accordion-close-summary-color: var(--color);
      --accordion-open-summary-color: var(--muted-color);
      --card-background-color: #141e26;
      --card-border-color: #11191f;
      --card-box-shadow: 0 0.125rem 1rem rgba(0, 0, 0, 0.06),
        0 0.125rem 2rem rgba(0, 0, 0, 0.12),
        0 0 0 0.0625rem rgba(0, 0, 0, 0.036);
      --card-sectionning-background-color: #18232c;
      --dropdown-background-color: #1b2832;
      --dropdown-border-color: #24333e;
      --dropdown-box-shadow: var(--card-box-shadow);
      --dropdown-color: var(--color);
      --dropdown-hover-background-color: rgba(36, 51, 62, 0.75);
      --modal-overlay-background-color: rgba(36, 51, 62, 0.9);
      --progress-background-color: #24333e;
      --progress-color: var(--primary);
      --loading-spinner-opacity: 0.5;
      --tooltip-background-color: var(--contrast);
      --tooltip-color: var(--contrast-inverse);
      --icon-checkbox: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23FFF' stroke-width='4' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='20 6 9 17 4 12'%3E%3C/polyline%3E%3C/svg%3E');
      --icon-chevron: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(162, 175, 185, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E');
      --icon-chevron-button: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(255, 255, 255, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E');
      --icon-chevron-button-inverse: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(0, 0, 0, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E');
      --icon-close: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(115, 130, 140, 0.999)' stroke-width='4' stroke-linecap='round' stroke-linejoin='round'%3E%3Cline x1='18' y1='6' x2='6' y2='18'%3E%3C/line%3E%3Cline x1='6' y1='6' x2='18' y2='18'%3E%3C/line%3E%3C/svg%3E');
      --icon-date: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(162, 175, 185, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Crect x='3' y='4' width='18' height='18' rx='2' ry='2'%3E%3C/rect%3E%3Cline x1='16' y1='2' x2='16' y2='6'%3E%3C/line%3E%3Cline x1='8' y1='2' x2='8' y2='6'%3E%3C/line%3E%3Cline x1='3' y1='10' x2='21' y2='10'%3E%3C/line%3E%3C/svg%3E');
      --icon-invalid: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(183, 28, 28, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='12' cy='12' r='10'%3E%3C/circle%3E%3Cline x1='12' y1='8' x2='12' y2='12'%3E%3C/line%3E%3Cline x1='12' y1='16' x2='12.01' y2='16'%3E%3C/line%3E%3C/svg%3E');
      --icon-minus: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23FFF' stroke-width='4' stroke-linecap='round' stroke-linejoin='round'%3E%3Cline x1='5' y1='12' x2='19' y2='12'%3E%3C/line%3E%3C/svg%3E');
      --icon-search: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(162, 175, 185, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='11' cy='11' r='8'%3E%3C/circle%3E%3Cline x1='21' y1='21' x2='16.65' y2='16.65'%3E%3C/line%3E%3C/svg%3E');
      --icon-time: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(162, 175, 185, 0.999)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='12' cy='12' r='10'%3E%3C/circle%3E%3Cpolyline points='12 6 12 12 16 14'%3E%3C/polyline%3E%3C/svg%3E');
      --icon-valid: url('data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(46, 125, 50, 0.999)' stroke-width='3' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='20 6 9 17 4 12'%3E%3C/polyline%3E%3C/svg%3E');
    }

    *,
    ::after,
    ::before {
      box-sizing: border-box;
      background-repeat: no-repeat;
    }

    ::after,
    ::before {
      text-decoration: inherit;
      vertical-align: inherit;
    }

    :where(:root) {
      -webkit-tap-highlight-color: transparent;
      -webkit-text-size-adjust: 100%;
      -moz-text-size-adjust: 100%;
      text-size-adjust: 100%;
      text-rendering: optimizeLegibility;
      background-color: var(--background-color);
      color: var(--color);
      font-weight: var(--font-weight);
      font-size: var(--font-size);
      line-height: var(--line-height);
      font-family: var(--font-family);
      overflow-wrap: break-word;
      cursor: default;
      -moz-tab-size: 4;
      -o-tab-size: 4;
      tab-size: 4;
    }

    main {
      display: block;
    }

    body {
      width: 100%;
      margin: 0;
    }

    body>footer,
    body>header,
    body>main {
      width: 100%;
      margin-right: auto;
      margin-left: auto;
      padding: var(--block-spacing-vertical) 0;
    }

    .container,
    .container-fluid {
      width: 100%;
      margin-right: auto;
      margin-left: auto;
      padding-right: var(--spacing);
      padding-left: var(--spacing);
    }

    @media (min-width: 576px) {
      .container {
        max-width: 510px;
        padding-right: 0;
        padding-left: 0;
      }
    }

    @media (min-width: 768px) {
      .container {
        max-width: 700px;
      }
    }

    @media (min-width: 992px) {
      .container {
        max-width: 920px;
      }
    }

    @media (min-width: 1200px) {
      .container {
        max-width: 1130px;
      }
    }

    section {
      margin-bottom: var(--block-spacing-vertical);
    }

    .grid {
      grid-column-gap: var(--grid-spacing-horizontal);
      grid-row-gap: var(--grid-spacing-vertical);
      display: grid;
      grid-template-columns: 1fr;
      margin: 0;
    }

    @media (min-width: 992px) {
      .grid {
        grid-template-columns: repeat(auto-fit, minmax(0%, 1fr));
      }
    }

    .grid>* {
      min-width: 0;
    }

    figure {
      display: block;
      margin: 0;
      padding: 0;
      overflow-x: auto;
    }

    figure figcaption {
      padding: calc(var(--spacing) * 0.5) 0;
      color: var(--muted-color);
    }

    b,
    strong {
      font-weight: bolder;
    }

    sub,
    sup {
      position: relative;
      font-size: 0.75em;
      line-height: 0;
      vertical-align: baseline;
    }

    sub {
      bottom: -0.25em;
    }

    sup {
      top: -0.5em;
    }

    address,
    blockquote,
    dl,
    figure,
    form,
    ol,
    p,
    pre,
    table,
    ul {
      margin-top: 0;
      margin-bottom: var(--typography-spacing-vertical);
      color: var(--color);
      font-style: normal;
      font-weight: var(--font-weight);
      font-size: var(--font-size);
    }

    [role='link'],
    a {
      --color: var(--primary);
      --background-color: transparent;
      outline: 0;
      background-color: var(--background-color);
      color: var(--color);
      -webkit-text-decoration: var(--text-decoration);
      text-decoration: var(--text-decoration);
    }

    [role='link']:is([aria-current], :hover, :active, :focus),
    a:is([aria-current], :hover, :active, :focus) {
      --color: var(--primary-hover);
      --text-decoration: underline;
    }

    [role='link']:focus,
    a:focus {
      --background-color: var(--primary-focus);
    }

    [role='link'].secondary,
    a.secondary {
      --color: var(--secondary);
    }

    [role='link'].secondary:is([aria-current], :hover, :active, :focus),
    a.secondary:is([aria-current], :hover, :active, :focus) {
      --color: var(--secondary-hover);
    }

    [role='link'].secondary:focus,
    a.secondary:focus {
      --background-color: var(--secondary-focus);
    }

    [role='link'].contrast,
    a.contrast {
      --color: var(--contrast);
    }

    [role='link'].contrast:is([aria-current], :hover, :active, :focus),
    a.contrast:is([aria-current], :hover, :active, :focus) {
      --color: var(--contrast-hover);
    }

    [role='link'].contrast:focus,
    a.contrast:focus {
      --background-color: var(--contrast-focus);
    }

    h1,
    h2,
    h3,
    h4,
    h5,
    h6 {
      margin-top: 0;
      margin-bottom: var(--typography-spacing-vertical);
      color: var(--color);
      font-weight: var(--font-weight);
      font-size: var(--font-size);
      font-family: var(--font-family);
    }

    h1 {
      --color: var(--h1-color);
    }

    h2 {
      --color: var(--h2-color);
    }

    h3 {
      --color: var(--h3-color);
    }

    h4 {
      --color: var(--h4-color);
    }

    h5 {
      --color: var(--h5-color);
    }

    h6 {
      --color: var(--h6-color);
    }

    :where(address, blockquote, dl, figure, form, ol, p, pre, table, ul)~ :is(h1, h2, h3, h4, h5, h6) {
      margin-top: var(--typography-spacing-vertical);
    }

    .headings,
    hgroup {
      margin-bottom: var(--typography-spacing-vertical);
    }

    .headings>*,
    hgroup>* {
      margin-bottom: 0;
    }

    .headings> :last-child,
    hgroup> :last-child {
      --color: var(--muted-color);
      --font-weight: unset;
      font-size: 1rem;
      font-family: unset;
    }

    p {
      margin-bottom: var(--typography-spacing-vertical);
    }

    small {
      font-size: var(--font-size);
    }

    :where(dl, ol, ul) {
      padding-right: 0;
      padding-left: var(--spacing);
      -webkit-padding-start: var(--spacing);
      padding-inline-start: var(--spacing);
      -webkit-padding-end: 0;
      padding-inline-end: 0;
    }

    :where(dl, ol, ul) li {
      margin-bottom: calc(var(--typography-spacing-vertical) * 0.25);
    }

    :where(dl, ol, ul) :is(dl, ol, ul) {
      margin: 0;
      margin-top: calc(var(--typography-spacing-vertical) * 0.25);
    }

    ul li {
      list-style: square;
    }

    mark {
      padding: 0.125rem 0.25rem;
      background-color: var(--mark-background-color);
      color: var(--mark-color);
      vertical-align: baseline;
    }

    blockquote {
      display: block;
      margin: var(--typography-spacing-vertical) 0;
      padding: var(--spacing);
      border-right: none;
      border-left: 0.25rem solid var(--blockquote-border-color);
      -webkit-border-start: 0.25rem solid var(--blockquote-border-color);
      border-inline-start: 0.25rem solid var(--blockquote-border-color);
      -webkit-border-end: none;
      border-inline-end: none;
    }

    blockquote footer {
      margin-top: calc(var(--typography-spacing-vertical) * 0.5);
      color: var(--blockquote-footer-color);
    }

    abbr[title] {
      border-bottom: 1px dotted;
      text-decoration: none;
      cursor: help;
    }

    ins {
      color: var(--ins-color);
      text-decoration: none;
    }

    del {
      color: var(--del-color);
    }

    ::-moz-selection {
      background-color: var(--primary-focus);
    }

    ::selection {
      background-color: var(--primary-focus);
    }

    :where(audio, canvas, iframe, img, svg, video) {
      vertical-align: middle;
    }

    audio,
    video {
      display: inline-block;
    }

    audio:not([controls]) {
      display: none;
      height: 0;
    }

    :where(iframe) {
      border-style: none;
    }

    img {
      max-width: 100%;
      height: auto;
      border-style: none;
    }

    :where(svg:not([fill])) {
      fill: currentColor;
    }

    svg:not(:root) {
      overflow: hidden;
    }

    button {
      margin: 0;
      overflow: visible;
      font-family: inherit;
      text-transform: none;
    }

    [type='button'],
    [type='reset'],
    [type='submit'],
    button {
      -webkit-appearance: button;
    }

    button {
      display: block;
      width: 100%;
      margin-bottom: var(--spacing);
    }

    [role='button'] {
      display: inline-block;
      text-decoration: none;
    }

    [role='button'],
    button,
    input[type='button'],
    input[type='reset'],
    input[type='submit'] {
      --background-color: var(--primary);
      --border-color: var(--primary);
      --color: var(--primary-inverse);
      --box-shadow: var(--button-box-shadow, 0 0 0 rgba(0, 0, 0, 0));
      padding: var(--form-element-spacing-vertical) var(--form-element-spacing-horizontal);
      border: var(--border-width) solid var(--border-color);
      border-radius: var(--border-radius);
      outline: 0;
      background-color: var(--background-color);
      box-shadow: var(--box-shadow);
      color: var(--color);
      font-weight: var(--font-weight);
      font-size: 1rem;
      line-height: var(--line-height);
      text-align: center;
      cursor: pointer;
    }

    [role='button']:is([aria-current], :hover, :active, :focus),
    button:is([aria-current], :hover, :active, :focus),
    input[type='button']:is([aria-current], :hover, :active, :focus),
    input[type='reset']:is([aria-current], :hover, :active, :focus),
    input[type='submit']:is([aria-current], :hover, :active, :focus) {
      --background-color: var(--primary-hover);
      --border-color: var(--primary-hover);
      --box-shadow: var(--button-hover-box-shadow, 0 0 0 rgba(0, 0, 0, 0));
      --color: var(--primary-inverse);
    }

    [role='button']:focus,
    button:focus,
    input[type='button']:focus,
    input[type='reset']:focus,
    input[type='submit']:focus {
      --box-shadow: var(--button-hover-box-shadow, 0 0 0 rgba(0, 0, 0, 0)),
        0 0 0 var(--outline-width) var(--primary-focus);
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).secondary,
    input[type='reset'] {
      --background-color: var(--secondary);
      --border-color: var(--secondary);
      --color: var(--secondary-inverse);
      cursor: pointer;
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).secondary:is([aria-current], :hover, :active, :focus),
    input[type='reset']:is([aria-current], :hover, :active, :focus) {
      --background-color: var(--secondary-hover);
      --border-color: var(--secondary-hover);
      --color: var(--secondary-inverse);
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).secondary:focus,
    input[type='reset']:focus {
      --box-shadow: var(--button-hover-box-shadow, 0 0 0 rgba(0, 0, 0, 0)),
        0 0 0 var(--outline-width) var(--secondary-focus);
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).contrast {
      --background-color: var(--contrast);
      --border-color: var(--contrast);
      --color: var(--contrast-inverse);
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).contrast:is([aria-current], :hover, :active, :focus) {
      --background-color: var(--contrast-hover);
      --border-color: var(--contrast-hover);
      --color: var(--contrast-inverse);
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).contrast:focus {
      --box-shadow: var(--button-hover-box-shadow, 0 0 0 rgba(0, 0, 0, 0)),
        0 0 0 var(--outline-width) var(--contrast-focus);
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).outline,
    input[type='reset'].outline {
      --background-color: transparent;
      --color: var(--primary);
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).outline:is([aria-current], :hover, :active, :focus),
    input[type='reset'].outline:is([aria-current], :hover, :active, :focus) {
      --background-color: transparent;
      --color: var(--primary-hover);
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).outline.secondary,
    input[type='reset'].outline {
      --color: var(--secondary);
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).outline.secondary:is([aria-current], :hover, :active, :focus),
    input[type='reset'].outline:is([aria-current], :hover, :active, :focus) {
      --color: var(--secondary-hover);
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).outline.contrast {
      --color: var(--contrast);
    }

    :is(button, input[type='submit'], input[type='button'], [role='button']).outline.contrast:is([aria-current], :hover, :active, :focus) {
      --color: var(--contrast-hover);
    }

    :where(button, [type='submit'], [type='button'], [type='reset'], [role='button'])[disabled],
    :where(fieldset[disabled]) :is(button, [type='submit'], [type='button'], [type='reset'], [role='button']),
    a[role='button']:not([href]) {
      opacity: 0.5;
      pointer-events: none;
    }

    input,
    optgroup,
    select,
    textarea {
      margin: 0;
      font-size: 1rem;
      line-height: var(--line-height);
      font-family: inherit;
      letter-spacing: inherit;
    }

    input {
      overflow: visible;
    }

    select {
      text-transform: none;
    }

    legend {
      max-width: 100%;
      padding: 0;
      color: inherit;
      white-space: normal;
    }

    textarea {
      overflow: auto;
    }

    [type='checkbox'],
    [type='radio'] {
      padding: 0;
    }

    ::-webkit-inner-spin-button,
    ::-webkit-outer-spin-button {
      height: auto;
    }

    [type='search'] {
      -webkit-appearance: textfield;
      outline-offset: -2px;
    }

    [type='search']::-webkit-search-decoration {
      -webkit-appearance: none;
    }

    ::-webkit-file-upload-button {
      -webkit-appearance: button;
      font: inherit;
    }

    ::-moz-focus-inner {
      padding: 0;
      border-style: none;
    }

    :-moz-focusring {
      outline: 0;
    }

    :-moz-ui-invalid {
      box-shadow: none;
    }

    ::-ms-expand {
      display: none;
    }

    [type='file'],
    [type='range'] {
      padding: 0;
      border-width: 0;
    }

    input:not([type='checkbox']):not([type='radio']):not([type='range']) {
      height: calc(1rem * var(--line-height) + var(--form-element-spacing-vertical) * 2 + var(--border-width) * 2);
    }

    fieldset {
      margin: 0;
      margin-bottom: var(--spacing);
      padding: 0;
      border: 0;
    }

    fieldset legend,
    label {
      display: block;
      margin-bottom: calc(var(--spacing) * 0.25);
      font-weight: var(--form-label-font-weight, var(--font-weight));
    }

    input:not([type='checkbox']):not([type='radio']),
    select,
    textarea {
      width: 100%;
    }

    input:not([type='checkbox']):not([type='radio']):not([type='range']):not([type='file']),
    select,
    textarea {
      -webkit-appearance: none;
      -moz-appearance: none;
      appearance: none;
      padding: var(--form-element-spacing-vertical) var(--form-element-spacing-horizontal);
      vertical-align: middle;
    }

    input,
    select,
    textarea {
      --background-color: var(--form-element-background-color);
      --border-color: var(--form-element-border-color);
      --color: var(--form-element-color);
      --box-shadow: none;
      border: var(--border-width) solid var(--border-color);
      border-radius: var(--border-radius);
      outline: 0;
      background-color: var(--background-color);
      box-shadow: var(--box-shadow);
      color: var(--color);
      font-weight: var(--font-weight);
    }

    :where(select, textarea):is(:active, :focus),
    input:not([type='submit']):not([type='button']):not([type='reset']):not([type='checkbox']):not([type='radio']):not([readonly]):is(:active, :focus) {
      --background-color: var(--form-element-active-background-color);
    }

    :where(select, textarea):is(:active, :focus),
    input:not([type='submit']):not([type='button']):not([type='reset']):not([role='switch']):not([readonly]):is(:active, :focus) {
      --border-color: var(--form-element-active-border-color);
    }

    input:not([type='submit']):not([type='button']):not([type='reset']):not([type='range']):not([type='file']):not([readonly]):focus,
    select:focus,
    textarea:focus {
      --box-shadow: 0 0 0 var(--outline-width) var(--form-element-focus-color);
    }

    :where(fieldset[disabled]) :is(input:not([type='submit']):not([type='button']):not([type='reset']), select, textarea),
    input:not([type='submit']):not([type='button']):not([type='reset'])[disabled],
    select[disabled],
    textarea[disabled] {
      --background-color: var(--form-element-disabled-background-color);
      --border-color: var(--form-element-disabled-border-color);
      opacity: var(--form-element-disabled-opacity);
      pointer-events: none;
    }

    :where(input, select, textarea):not([type='checkbox']):not([type='radio'])[aria-invalid] {
      padding-right: calc(var(--form-element-spacing-horizontal) + 1.5rem);
      padding-left: var(--form-element-spacing-horizontal);
      -webkit-padding-start: var(--form-element-spacing-horizontal);
      padding-inline-start: var(--form-element-spacing-horizontal);
      -webkit-padding-end: calc(var(--form-element-spacing-horizontal) + 1.5rem);
      padding-inline-end: calc(var(--form-element-spacing-horizontal) + 1.5rem);
      background-position: center right 0.75rem;
      background-size: 1rem auto;
      background-repeat: no-repeat;
    }

    :where(input, select, textarea):not([type='checkbox']):not([type='radio'])[aria-invalid='false'] {
      background-image: var(--icon-valid);
    }

    :where(input, select, textarea):not([type='checkbox']):not([type='radio'])[aria-invalid='true'] {
      background-image: var(--icon-invalid);
    }

    :where(input, select, textarea)[aria-invalid='false'] {
      --border-color: var(--form-element-valid-border-color);
    }

    :where(input, select, textarea)[aria-invalid='false']:is(:active, :focus) {
      --border-color: var(--form-element-valid-active-border-color);
      --box-shadow: 0 0 0 var(--outline-width) var(--form-element-valid-focus-color);
    }

    :where(input, select, textarea)[aria-invalid='true'] {
      --border-color: var(--form-element-invalid-border-color);
    }

    :where(input, select, textarea)[aria-invalid='true']:is(:active, :focus) {
      --border-color: var(--form-element-invalid-active-border-color);
      --box-shadow: 0 0 0 var(--outline-width) var(--form-element-invalid-focus-color);
    }

    [dir='rtl'] :where(input, select, textarea):not([type='checkbox']):not([type='radio'])[aria-invalid='false'],
    [dir='rtl'] :where(input, select, textarea):not([type='checkbox']):not([type='radio'])[aria-invalid='true'],
    [dir='rtl'] :where(input, select, textarea):not([type='checkbox']):not([type='radio'])[aria-invalid] {
      background-position: center left 0.75rem;
    }

    input::-webkit-input-placeholder,
    input::placeholder,
    select:invalid,
    textarea::-webkit-input-placeholder,
    textarea::placeholder {
      color: var(--form-element-placeholder-color);
      opacity: 1;
    }

    input:not([type='checkbox']):not([type='radio']),
    select,
    textarea {
      margin-bottom: var(--spacing);
    }

    select::-ms-expand {
      border: 0;
      background-color: transparent;
    }

    select:not([multiple]):not([size]) {
      padding-right: calc(var(--form-element-spacing-horizontal) + 1.5rem);
      padding-left: var(--form-element-spacing-horizontal);
      -webkit-padding-start: var(--form-element-spacing-horizontal);
      padding-inline-start: var(--form-element-spacing-horizontal);
      -webkit-padding-end: calc(var(--form-element-spacing-horizontal) + 1.5rem);
      padding-inline-end: calc(var(--form-element-spacing-horizontal) + 1.5rem);
      background-image: var(--icon-chevron);
      background-position: center right 0.75rem;
      background-size: 1rem auto;
      background-repeat: no-repeat;
    }

    [dir='rtl'] select:not([multiple]):not([size]) {
      background-position: center left 0.75rem;
    }

    :where(input, select, textarea)+small {
      display: block;
      width: 100%;
      margin-top: calc(var(--spacing) * -0.75);
      margin-bottom: var(--spacing);
      color: var(--muted-color);
    }

    label> :where(input, select, textarea) {
      margin-top: calc(var(--spacing) * 0.25);
    }

    :where(table) {
      width: 100%;
      border-collapse: collapse;
      border-spacing: 0;
      text-indent: 0;
    }

    td,
    th {
      padding: calc(var(--spacing) / 2) var(--spacing);
      border-bottom: var(--border-width) solid var(--table-border-color);
      color: var(--color);
      font-weight: var(--font-weight);
      font-size: var(--font-size);
      text-align: left;
      text-align: start;
    }

    tfoot td,
    tfoot th {
      border-top: var(--border-width) solid var(--table-border-color);
      border-bottom: 0;
    }

    table[role='grid'] tbody tr:nth-child(odd) {
      background-color: var(--table-row-stripped-background-color);
    }

    [aria-controls] {
      cursor: pointer;
    }

    [aria-disabled='true'],
    [disabled] {
      cursor: not-allowed;
    }

    [aria-hidden='false'][hidden] {
      display: initial;
    }

    [aria-hidden='false'][hidden]:not(:focus) {
      clip: rect(0, 0, 0, 0);
      position: absolute;
    }

    [tabindex],
    a,
    area,
    button,
    input,
    label,
    select,
    summary,
    textarea {
      -ms-touch-action: manipulation;
    }

    [dir='rtl'] {
      direction: rtl;
    }

    /*# sourceMappingURL=pico.slim.min.css.map */
  </style>
</head>
<script>
  function sendDataToSketchUp() {
    var user_input1 = document.getElementById('id1');
    var user_input2 = document.getElementById('id2');
    var user_input3 = document.getElementById('id3');
    var user_input4 = document.getElementById('id4');
    var user_input5 = document.getElementById('id5');
    sketchup.getUserInput(
      user_input1.value,
      user_input2.value,
      user_input3.value,
      user_input4.value,
      user_input5.value
    );  
  }
</script>

<body>
    <main class='container' style='width: 300px;'>
        <h2>Shadow hunters</h2>
        <h4 style='margin-bottom: 8px;'>Set analysis duration and steps:</h4>
        <button onclick='sketchup.getFolder()' class='outline'>Select folder</button>
        <form style='margin: 0px; '>
            <label for='start'>start: (hours)</label>
            <input id='id1' type='number' name='start' value='6' required />
            <label for='end'>end: (hours)</label>
            <input id='id2' type='number' name='end' value='18' required />
            <label for='steps'>steps: (minutes between)</label>
            <input id='id3' type='number' name='steps' value='60' required />
            <h6 style='margin: 7px'>Output settings:</h6>
            <div style='width: 143px; display: inline-block;'>
                <label for='width' style='font-size:medium; margin-bottom: 5px;'>width :(px)</label>
                <input style='height: 30px;' id='id4' type='number' name='width' value='1500' required />
            </div>
            <div style='width: 143px; display: inline-block;'>
                <label for='height' style='font-size:medium; margin-bottom: 5px;'>height :(px)</label>
                <input style='height: 30px;' id='id5' type='number' name='height' value='1000' required />
            </div>
        </form>
        <p id='progress' style='margin: 8px'></p>
        <button onclick='sendDataToSketchUp()' class='secondary'>Generate images</button>
    </main>
</body>
</html>
"
  
mymenu = UI.menu('Plugins')
mymenu.add_item('Shadow hunting') {
  
  dialog = UI::HtmlDialog.new(
  {
    :dialog_title => "Settings",
    :scrollable => false,
    :resizable => false,
    :width => 330,
    :height => 550,
    :left => 200,
    :top => 200,
    :min_width => 50,
    :min_height => 50,
    :max_width =>400,
    :max_height => 600,
    :style => UI::HtmlDialog::STYLE_DIALOG
  })
    
  dialog.set_html(html)
  dialog.show
  dialog.add_action_callback("getFolder"){|action_context|
    # get output folder
    $folderName = UI.select_directory(
      title: "Select Image Destination Directory",
      directory: File.expand_path('~'), # User's HOME dir
      select_multiple: false
    )
  }
    
  dialog.add_action_callback("getUserInput"){|action_context, user_input1, user_input2, user_input3, user_input4, user_input5|
    sunStart = user_input1.to_i * 60
    sunEnd = user_input2.to_i * 60
    sunSteps = user_input3.to_i
    outWidth = user_input4.to_i
    outHeight = user_input5.to_i
    
    if $folderName.nil?
      js_setProgress = "document.getElementById('progress').innerHTML = 'output folder missing!'"
      dialog.execute_script(js_setProgress)
      
    else
      shadowinfo = mod.shadow_info
      day = shadowinfo["ShadowTime"]
      day = Time.new(day.year, day.month, day.day, 0, 0, 0)

      times = Array.new
      i = sunStart
      while i <= sunEnd
        d = day + i *60
        times.push(d)
        i += sunSteps
      end

      js_setProgress = "document.getElementById('progress').innerHTML = 'progress...'"
      dialog.execute_script(js_setProgress)

      j = 0
      $imgNames = Array.new
      times.each { |i|
        shadowinfo["ShadowTime"] = i
        fileName = $folderName + "/" + i.ctime.gsub(":", '-') + ".png"
        $imgNames.push(fileName)
        options = {
          :filename => fileName,
          :width => outWidth,
          :height => outHeight,
          :antialias => false
        }
        view.write_image(options)
      }
      js_setProgress = "document.getElementById('progress').innerHTML = 'Done'"
      dialog.execute_script(js_setProgress)
    end
  }
}
