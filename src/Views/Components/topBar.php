<header class="topbar" data-navbarbg="skin6">
    <nav class="navbar top-navbar navbar-expand-lg">
        <div class="navbar-header" data-logobg="skin6">
            <a class="nav-toggler waves-effect waves-light d-block d-lg-none" href="javascript:void(0)"><i
                    class="ti-menu ti-close"></i></a>

            <div class="navbar-brand justify-content-center">
                <a href="home">
                    <img src="./assets/img/logo_letras.svg" alt="" class="img-fluid items-center">
                </a>
            </div>

            <a class="topbartoggler d-block d-lg-none waves-effect waves-light" href="javascript:void(0)"
                data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i
                    class="ti-more"></i></a>
        </div>

        <div class="navbar-collapse collapse" id="navbarSupportedContent">

            <ul class="navbar-nav float-left me-auto ms-3 ps-1">
                <!-- Notification -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle pl-md-3 position-relative" href="javascript:void(0)"
                        id="bell" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                        <span><i data-feather="bell" class="svg-icon"></i></span>
                        <span class="badge text-bg-secondary notify-no rounded-circle">5</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-left mailbox animated bounceInDown">
                        <ul class="list-style-none">
                            <li>
                                <div class="message-center notifications position-relative">
                                    <!-- Message -->
                                    <a href="javascript:void(0)"
                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                        <div class="btn btn-danger rounded-circle btn-circle"><i
                                                data-feather="airplay" class="text-white"></i></div>
                                        <div class="w-75 d-inline-block v-middle ps-2">
                                            <h6 class="message-title mb-0 mt-1">Luanch Admin</h6>
                                            <span class="font-12 text-nowrap d-block text-muted">Just see
                                                the my new
                                                admin!</span>
                                            <span class="font-12 text-nowrap d-block text-muted">9:30 AM</span>
                                        </div>
                                    </a>
                                    <!-- Message -->
                                    <a href="javascript:void(0)"
                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                        <span class="btn btn-success text-white rounded-circle btn-circle"><i
                                                data-feather="calendar" class="text-white"></i></span>
                                        <div class="w-75 d-inline-block v-middle ps-2">
                                            <h6 class="message-title mb-0 mt-1">Event today</h6>
                                            <span
                                                class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                                a reminder that you have event</span>
                                            <span class="font-12 text-nowrap d-block text-muted">9:10 AM</span>
                                        </div>
                                    </a>
                                    <!-- Message -->
                                    <a href="javascript:void(0)"
                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                        <span class="btn btn-info rounded-circle btn-circle"><i
                                                data-feather="settings" class="text-white"></i></span>
                                        <div class="w-75 d-inline-block v-middle ps-2">
                                            <h6 class="message-title mb-0 mt-1">Settings</h6>
                                            <span
                                                class="font-12 text-nowrap d-block text-muted text-truncate">You
                                                can customize this template
                                                as you want</span>
                                            <span class="font-12 text-nowrap d-block text-muted">9:08 AM</span>
                                        </div>
                                    </a>
                                    <!-- Message -->
                                    <a href="javascript:void(0)"
                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                        <span class="btn btn-primary rounded-circle btn-circle"><i
                                                data-feather="box" class="text-white"></i></span>
                                        <div class="w-75 d-inline-block v-middle ps-2">
                                            <h6 class="message-title mb-0 mt-1">Pavan kumar</h6> <span
                                                class="font-12 text-nowrap d-block text-muted">Just
                                                see the my admin!</span>
                                            <span class="font-12 text-nowrap d-block text-muted">9:02 AM</span>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <a class="nav-link pt-3 text-center text-dark" href="javascript:void(0);">
                                    <strong>Ver más</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>


                <li class="nav-item" data-bs-toggle="tooltip" data-bs-title="Ayuda Interactiva" data-bs-placement="top">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i data-feather="info" class="svg-icon"></i>
                    </a>
                </li>
                <li class="nav-item d-none d-md-block">
                    <a class="nav-link" href="javascript:void(0)">
                        <div class="customize-input">
                            <select
                                class="custom-select form-control bg-white custom-radius custom-shadow border-0">
                                <option selected value="1">USD</option>
                                <option value="2">BS</option>
                            </select>
                        </div>
                    </a>
                </li>
                <li class="nav-item" style="display: flex; align-items: center">
                    <label for="themeToggle" class="themeToggle st-sunMoonThemeToggleBtn" type="checkbox">
                        <input type="checkbox" checked id="themeToggle" class="themeToggleInput" />
                        <svg width="18" height="18" viewBox=" 0 0 20 20" fill="currentColor" stroke="none">
                            <mask id="moon-mask">
                                <rect x="0" y="0" width="20" height="20" fill="white"></rect>
                                <circle cx="11" cy="3" r="8" fill="black"></circle>
                            </mask>
                            <circle class="sunMoon" cx="10" cy="10" r="8" mask="url(#moon-mask)"></circle>
                            <g>
                                <circle class="sunRay sunRay1" cx="18" cy="10" r="1.5"></circle>
                                <circle class="sunRay sunRay2" cx="14" cy="16.928" r="1.5"></circle>
                                <circle class="sunRay sunRay3" cx="6" cy="16.928" r="1.5"></circle>
                                <circle class="sunRay sunRay4" cx="2" cy="10" r="1.5"></circle>
                                <circle class="sunRay sunRay5" cx="6" cy="3.1718" r="1.5"></circle>
                                <circle class="sunRay sunRay6" cx="14" cy="3.1718" r="1.5"></circle>
                            </g>
                        </svg>
                    </label>
                </li>
            </ul>

            <ul class="navbar-nav float-end">

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-bs-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <img src="./assets/img/users/profile-pic.jpg" alt="user" class="rounded-circle"
                            width="40">
                        <span class="ms-2 d-none d-lg-inline-block"><span>Hola,</span> <span
                                class="text-dark">Felix Dominguez</span> <i data-feather="chevron-down"
                                class="svg-icon"></i></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-right user-dd animated flipInY">
                        <a class="dropdown-item" href="profile"><i data-feather="user"
                                class="svg-icon me-2 ms-1"></i>
                            Mi perfil</a>

                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="login"><i data-feather="power"
                                class="svg-icon me-2 ms-1"></i>
                            Logout</a>
                    </div>
                </li>

            </ul>
        </div>
    </nav>
</header>