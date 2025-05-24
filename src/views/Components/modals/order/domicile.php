<div class="modal fade" id="domicile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen">
		<div class="modal-content">
			<div class="d-flex justify-content-end p-2">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-0 overflow-x-hidden">
				<div id="stepper" class="bs-stepper">
					<div class="bs-stepper-header" role="tablist">
						<!-- Paso 1 -->
						<div class="step" data-target="#step-1">
							<button type="button" class="step-trigger" role="tab" id="steppertrigger1" aria-controls="step-1">
								<span class="bs-stepper-circle">1</span>
								<span class="bs-stepper-label d-none">Productos</span>
							</button>
						</div>
						<div class="line"></div>
						<!-- Paso 2 -->
						<div class="step" data-target="#step-2">
							<button type="button" class="step-trigger" role="tab" id="steppertrigger2" aria-controls="step-2">
								<span class="bs-stepper-circle">2</span>
								<span class="bs-stepper-label d-none">Dirección</span>
							</button>
						</div>
						<div class="line"></div>
						<!-- Paso 3 -->
						<div class="step" data-target="#step-3">
							<button type="button" class="step-trigger" role="tab" id="steppertrigger3" aria-controls="step-3">
								<span class="bs-stepper-circle">3</span>
								<span class="bs-stepper-label d-none">Detalles de Pago</span>
							</button>
						</div>
						<div class="line"></div>
						<!-- Paso 5 -->
						<div class="step" data-target="#step-5">
							<button type="button" class="step-trigger" role="tab" id="steppertrigger5" aria-controls="step-5">
								<span class="bs-stepper-circle">5</span>
								<span class="bs-stepper-label d-none">Confirmación</span>
							</button>
						</div>
					</div>

					<div class="bs-stepper-content">
						<div id="step-1" class="content" role="tabpanel" aria-labelledby="steppertrigger1">
							<h5 class="text-center fs-3 mt-2 mb-4">SELECCIONAR PRODUCTOS</h5>
							<div class="row">
								<div class="row mb-5">
									<div class="d-flex gap-2 justify-content-start flex-wrap ps-0">
										<div>
											<input type="radio" class="btn-check" name="options-outlined" id="success-outlined" autocomplete="off" checked>
											<label class="btn bh_1CHECKBOX rounded-pill" for="success-outlined">Checked success radio</label>
										</div>
										<div>
											<input type="radio" class="btn-check" name="options-outlined" id="danger-outlined" autocomplete="off">
											<label class="btn bh_1CHECKBOX rounded-pill" for="danger-outlined">Danger radio</label>
										</div>
									</div>
								</div>
								<div class="row">
									<?php for ($i = 0; $i < 10; $i++) { ?>
										<div class="col-md-6 col-lg-3">
											<div class="card position-relative">
												<div class="counter-container position-absolute" style="top: -10px; right: -5px;">
													<button class="trigger-btn p-1 plusTrigger">
														<i data-feather="plus"></i>
													</button>
													<div class="controls" id="controls">
														<button class="btn-round me-2 p-1 minusBtn">
															<i data-feather="minus"></i>
														</button>
														<input type="text" class="number-input" value="0" readonly>
														<button class="btn-round ms-2 p-1 plusBtn">
															<i data-feather="plus"></i>
														</button>
													</div>
												</div>
												<div class="card-body">
													<div class="row">
														<div class="col-md-4 align-items-center d-flex justify-content-center">
															<img src="./assets/img/big/banner_register.png" class="rounded-circle" width="100" alt="">
														</div>
														<div class="col-md-8">
															<h4>Hamburguesa</h4>
															<p class="text-muted fs-6">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
															<h4 class="border text-center rounded-pill p-1 fs-6 w-75">Precio: 2.50$</h4>
														</div>

													</div>
												</div>
											</div>
										</div>
									<?php } ?>
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<button class="btn bh_1 mt-3 text-white" onclick="stepper.next()">Siguiente</button>
							</div>
						</div>
						<div id="step-2" class="content" role="tabpanel" aria-labelledby="steppertrigger2">
							<h5 class="text-center fs-3 mt-2 mb-4">DETALLES DE LA ORDEN</h5>
							<h4>COMIDA</h4>
							<hr>
							<div class="row">
								<div class="row">
									<div class="col-lg-3 col-md-6">
										<div class="card position-relative">
											<div class="card-body">
												<div class="row">
													<div class="col-md-6 col-lg-6 d-flex flex-column align-items-center justify-content-center gap-2">
														<img src="./assets/img/big/banner_register.png" class="rounded-circle" width="100" alt="">
														<textarea class="form-control" placeholder="detalles" rows="3"></textarea>
														<div class="counter-container mb-2">
															<button class="trigger-btn p-1 plusTrigger">
																<i data-feather="plus"></i>
															</button>
															<div class="controls" id="controls">
																<button class="btn-round me-2 p-1 minusBtn">
																	<i data-feather="minus"></i>
																</button>
																<input type="text" class="number-input" value="0" readonly>
																<button class="btn-round ms-2 p-1 plusBtn">
																	<i data-feather="plus"></i>
																</button>
															</div>
														</div>
													</div>
													<div class="col-md-6 col-lg-6 align-items-center d-flex justify-content-center border border-2 rounded-3">
														<div class="d-flex flex-column align-items-center justify-content-center p-3">
															<i data-feather="plus-circle"></i>
															<h4 class="m-0">Adicional</h4>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<button class="btn bh_5 text-white mt-3 me-2" onclick="stepper.previous()">Anterior</button>
								<button class="btn bh_1 text-white mt-3" onclick="stepper.next()">Siguiente</button>
							</div>
						</div>
						<div id="step-3" class="content" role="tabpanel" aria-labelledby="steppertrigger3">
							<h5>Detalles de Pago</h5>
							<p>Formulario para ingresar detalles de pago.</p>
							<button class="btn btn-secondary mt-3 me-2" onclick="stepper.previous()">Anterior</button>
							<button class="btn btn-primary mt-3" onclick="stepper.next()">Siguiente</button>
						</div>
						<div id="step-5" class="content" role="tabpanel" aria-labelledby="steppertrigger5">
							<h5>Confirmación</h5>
							<p>Confirmación final y envío.</p>
							<button class="btn btn-secondary mt-3 me-2" onclick="stepper.previous()">Anterior</button>
							<button class="btn btn-success mt-3" onclick="alert('Formulario enviado')">Enviar</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>