/**
 * Scripts Globales - main.js
 * Empresa de Tortillas, Nachos y Harina
 * 
 * Funciones JavaScript del cliente para:
 * - Validación de formularios
 * - Interacciones dinámicas
 * - Mensajes de usuario
 */

document.addEventListener('DOMContentLoaded', function() {
  console.log('✓ Aplicación cargada');
  
  // Inicializar componentes
  initializeFormValidation();
  initializeAlerts();
  initializeSmoothScroll();
});

/**
 * Valida formularios en el cliente antes de enviar
 */
function initializeFormValidation() {
  const forms = document.querySelectorAll('form');
  
  forms.forEach(form => {
    form.addEventListener('submit', function(e) {
      // Validar campos requeridos
      const requiredFields = this.querySelectorAll('[required]');
      let isValid = true;

      requiredFields.forEach(field => {
        if (!field.value.trim()) {
          isValid = false;
          field.style.borderColor = '#FF6B6B';
          field.addEventListener('input', function() {
            this.style.borderColor = '';
          });
        }
      });

      if (!isValid) {
        e.preventDefault();
        showAlert('Por favor completa todos los campos requeridos', 'error');
      }
    });
  });
}

/**
 * Muestra alertas al usuario
 * @param {string} message - Mensaje a mostrar
 * @param {string} type - Tipo de alerta: 'success', 'error', 'warning', 'info'
 */
function showAlert(message, type = 'info') {
  const alertDiv = document.createElement('div');
  alertDiv.className = `alert alert-${type}`;
  alertDiv.innerHTML = `
    <i class="fas fa-${getIconClass(type)}"></i>
    <span>${message}</span>
  `;
  
  // Insertar al principio del contenedor principal
  const container = document.querySelector('.container') || document.body;
  container.insertBefore(alertDiv, container.firstChild);
  
  // Remover después de 5 segundos
  setTimeout(() => {
    alertDiv.remove();
  }, 5000);
}

/**
 * Obtiene el icono correspondiente al tipo de alerta
 */
function getIconClass(type) {
  const icons = {
    'success': 'check-circle',
    'error': 'exclamation-circle',
    'warning': 'exclamation-triangle',
    'info': 'info-circle'
  };
  return icons[type] || 'info-circle';
}

/**
 * Inicializa alertas existentes en la página
 */
function initializeAlerts() {
  const alerts = document.querySelectorAll('.alert');
  
  alerts.forEach(alert => {
    // Remover alertas después de 5 segundos
    setTimeout(() => {
      alert.style.opacity = '0';
      alert.style.transition = 'opacity 0.3s ease';
      setTimeout(() => alert.remove(), 300);
    }, 5000);
  });
}

/**
 * Smooth scroll para enlaces internos
 */
function initializeSmoothScroll() {
  const links = document.querySelectorAll('a[href^="#"]');
  
  links.forEach(link => {
    link.addEventListener('click', function(e) {
      const href = this.getAttribute('href');
      if (href === '#') return;
      
      const target = document.querySelector(href);
      if (!target) return;
      
      e.preventDefault();
      target.scrollIntoView({ behavior: 'smooth' });
    });
  });
}

/**
 * Función auxiliar para hacer requests AJAX
 * @param {string} url - URL del endpoint
 * @param {object} options - Opciones (method, data, headers)
 */
async function fetchAPI(url, options = {}) {
  try {
    const response = await fetch(url, {
      method: options.method || 'GET',
      headers: {
        'Content-Type': 'application/json',
        ...options.headers
      },
      body: options.data ? JSON.stringify(options.data) : undefined
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    console.error('Error en fetchAPI:', error);
    showAlert('Error en la solicitud. Intenta de nuevo.', 'error');
    throw error;
  }
}

/**
 * Muestra un modal de confirmación
 * @param {string} title - Título del modal
 * @param {string} message - Mensaje
 * @param {function} onConfirm - Callback si confirma
 */
function showConfirmModal(title, message, onConfirm) {
  const confirmed = confirm(`${title}\n\n${message}`);
  if (confirmed) {
    onConfirm();
  }
}

/**
 * Formatea una fecha al formato local
 * @param {string|Date} date - Fecha a formatear
 */
function formatDate(date) {
  return new Date(date).toLocaleDateString('es-ES', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit'
  });
}

/**
 * Formatea moneda
 * @param {number} amount - Monto a formatear
 */
function formatCurrency(amount) {
  return new Intl.NumberFormat('es-ES', {
    style: 'currency',
    currency: 'MXN'
  }).format(amount);
}

// Exportar funciones globales
window.appUtils = {
  showAlert,
  fetchAPI,
  showConfirmModal,
  formatDate,
  formatCurrency
};
