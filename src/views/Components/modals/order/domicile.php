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
								<span class="bs-stepper-circle">4</span>
								<span class="bs-stepper-label d-none">Confirmación</span>
							</button>
						</div>
					</div>
					<div class="bs-stepper-content">
						<div id="step-1" class="content" role="tabpanel" aria-labelledby="steppertrigger1">
							<h5 class="text-center fs-3 mt-2 mb-4">SELECCIONAR PRODUCTOS</h5>
							<div class="row">
								<div class="row mb-5">
									<div class="d-flex gap-2 justify-content-start flex-wrap ps-0 cont_category_product_orders">
										<div>
											<input type="radio" class="btn-check" data-filter="all" name="options-outlined" id="success-outlined" autocomplete="off" checked>
											<label class="btn bh_1CHECKBOX rounded-pill" for="success-outlined">Todos</label>
										</div>
									</div>
								</div>
								<div class="row cont-select-product-order">
									<!-- Productos -->
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<button class="btn bh_1 mt-3 text-white select_product_btn_next">Siguiente</button>
							</div>
						</div>
						<div id="step-2" class="content" role="tabpanel" aria-labelledby="steppertrigger2">
							<h5 class="text-center fs-3 mt-2 mb-4">DETALLES DE LA ORDEN</h5>
							<h4>COMIDA</h4>
							<hr>
							<div class="row cont-details-product-order-food">

							</div>
							<h4>OTROS</h4>
							<hr>
							<div class="row cont-details-product-order-other">
								<!-- Otros -->
							</div>
							<hr>
							<div class="row">
								<div class="card">
									<div class="card-body">
										<h4 class="subtotal">SUBTOTAL: 10 $</h4>
										<h4 class="iva">IVA: 025 $</h4>
										<hr>
										<h4 class="total-amount">TOTAL BS: 10 -- USD: 10</h4>
									</div>
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<button class="btn bh_5 text-white mt-3 me-2" onclick="stepper.previous()">Anterior</button>
								<button class="btn bh_1 text-white mt-3" onclick="stepper.next()">Siguiente</button>
							</div>
						</div>
						<div id="step-3" class="content" role="tabpanel" aria-labelledby="steppertrigger3">
							<h5 class="text-center fs-3 mt-2 mb-4">PAGAR ORDEN</h5>
							<h4>CLIENTE</h4>
							<hr class="mb-1">
							<div class="row">
								<form class="row g-3" id="form-search-client-order">
									<div class="col-auto">
										<input type="search" class="form-control" placeholder="Documento">
									</div>
									<div class="col-auto">
										<button type="submit" class="btn bh_1 text-white mb-3">Buscar</button>
									</div>
								</form>
								<div class="row cont_client-order">
									<div class="col-md-12 d-flex justify-content-center align-items-center my-5 loader_client_order">
										<h3>No hay clientes seleccionados</h3>
										<div class="d-flex align-items-center gap-2 d-none">
											<div class="spinner-grow" style="color: #FF4B00" role="status">
												<span class="visually-hidden">Loading...</span>
											</div>
											<div class="spinner-grow" style="color: #FF4B00" role="status">
												<span class="visually-hidden">Loading...</span>
											</div>
											<div class="spinner-grow" style="color: #FF4B00" role="status">
												<span class="visually-hidden">Loading...</span>
											</div>
											<div class="spinner-grow" style="color: #FF4B00" role="status">
												<span class="visually-hidden">Loading...</span>
											</div>
											<div class="spinner-grow" style="color: #FF4B00" role="status">
												<span class="visually-hidden">Loading...</span>
											</div>
										</div>
									</div>
									<!-- Clientes -->
								</div>
							</div>
							<h4>METODOS DE PAGO</h4>
							<hr>
							<div class="row">
								<div class="col-md-6 mb-3">
									<div class="d-flex align-items-center gap-3">
										<div class="d-flex align-items-center gap-1">
											<h5 class="m-0">TOTAL USD </h5>
											<p class="m-0 amount_payment_usd"> 10$</p>
										</div>
										<div class="d-flex align-items-center gap-1">
											<h5 class="m-0">TOTAL BS </h5>
											<p class="m-0 amount_payment_bs"> 10$</p>
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="card">
										<div class="card-body">
											<form class="row g-2" id="form-submit-payment">
												<div id="payments-container">
													<div class="row g-2 payments" id="payments-1">
														<div class="col-md-6">
															<label for="inputCity" class="form-label">Metodo de pago</label>
															<div class="dropdown select_options_payment">
																<div class="dropdown">
																	<div class="btn-group w-100" bis_skin_checked="1">
																		<input type="button" class="btn btn-light w-75 text-start fs-6" value="Seleccione una opcion" id="input-payment-order-1" name="id_metodo_pago" data-id="Seleccione una opcion">
																		<button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																			<span> <i data-feather="chevron-down"></i></span>
																		</button>
																		<div class="dropdown-menu p-2" bis_skin_checked="1">
																			<div>
																				<input class="form-control search_select" type="search" placeholder="Buscar">
																			</div>
																			<div class="options_search">

																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="text-danger mt-1 fs-6" id="error-input-payment-order-1"></div>
														</div>
														<div class="col-md-6">
															<label for="inputEmail4" class="form-label">Cantidad</label>
															<div class="input-group">
																<span class="input-group-text type_payment">N/S</span>
																<input type="text" class="form-control w-75" placeholder="0.00" input_price id="input-quantity-order-1" name="cantidad">
																<div class="text-danger mt-1 fs-6" id="error-input-quantity-order-1"></div>
															</div>
														</div>
														<div class="col-md-12">
															<label for="inputEmail4" class="form-label">Referencia</label>
															<input type="text" class="form-control" placeholder="Referencia" id="input-reference-order-1" name="referencia">
															<div class="text-danger mt-1 fs-6" id="error-input-reference-order-1"></div>
														</div>
														<div class="col-12">
															<label for="inputZip" class="form-label">Comprobante</label>
															<input class="form-control input-image" type="file" id="input-comprobante-order-1" name="imagen">
															<div class="text-danger mt-1 fs-6" id="error-input-comprobante-order-1"></div>
														</div>
														<img class="mt-3" src="" alt="Vista previa" style="max-width: 200px; display: none;">
													</div>
												</div>
												<button type="button" id="add-payment-order-btn" class="btn btn-secondary mt-3">Agregar Pago</button>
												<input type="submit" class="d-none" id="submit-payment-order">
											</form>
										</div>
									</div>
								</div>
							</div>
							<button class="btn btn-secondary mt-3 me-2" onclick="stepper.previous()">Anterior</button>
							<button class="btn btn-primary mt-3 btn_next_payment">Siguiente</button>
						</div>
						<div id="step-5" class="content" role="tabpanel" aria-labelledby="steppertrigger5">
							<h5 class="text-center fs-3 mt-2 mb-4">CONFIRMACION</h5>
							<div class="row mb-4">
								<div class="d-flex justify-content-start gap-3">
									<div>NOMBRE: JOSE PEREZ</div>
									<div>DOCUMENTO: 12345678</div>
								</div>
							</div>
							<h4>PRODUCTOS</h4>
							<hr>
							<div class="table-responsive mb-5">
								<table class="table table-dark-mode">
									<thead>
										<th>PRODUCTO</th>
										<th>DETALLE</th>
										<th>CANTIDAD</th>
										<th>DETALLES</th>
										<th>ADICIONALES</th>
									</thead>
									<tbody>
										<tr>
											<td>Hamburguesa</td>
											<td>Con queso y tocino</td>
											<td>2</td>
											<td>Con papas fritas</td>
											<td>Sin cebolla</td>
										</tr>
										<tr>
											<td>Papas Fritas</td>
											<td>Porción grande</td>
											<td>1</td>
											<td>Con salsa de queso</td>
											<td>Con salsa de ajo</td>
										</tr>
									</tbody>
								</table>
							</div>
							<h4>DETALLES DE PAGO</h4>
							<hr>
							<div class="table-responsive mb-5">
								<table class="table table-dark-mode">
									<thead>
										<th>METODO</th>
										<th>CANTIDAD</th>
										<th>REFERENCIA</th>
										<th>COMPROBANTE</th>
									</thead>
									<tbody>
										<tr>
											<td>Tarjeta de Crédito</td>
											<td>10.00 $</td>
											<td>1234567890</td>
											<td><img src="comprobante.jpg" alt="Comprobante" style="max-width: 100px;"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h4>DIRECCION DE ENVIO</h4>
							<hr>
							<div class="row">
								<textarea class="form-control" placeholder="Direccion" rows="5"></textarea>
							</div>
							<button class="btn btn-secondary mt-3 me-2" onclick="stepper.previous()">Anterior</button>
							<button class="btn btn-success mt-3 confirm_order">Enviar</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>