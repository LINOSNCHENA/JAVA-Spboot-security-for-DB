export default {
  server: {
    port: 3005,
    host: '127.0.0.1',
    timing: false,
    open: true
  },

  head: {
    title: 'mmachine-frontend',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    'bootstrap-vue/nuxt',
    "@nuxtjs/axios",
    "@nuxtjs/auth-next"
  ],
  auth: {
    strategies: {
      local: {
        scheme: "refresh",
        token: {
          property: "token",
          global: true,
          required: true,
          type: "Bearer"
        },
        user: {
          property: "user",
          autoFetch: true
        },
        refreshToken: {
          property: "refresh_token",
          data: "refresh_token",
        },
        endpoints: {
          login: { url: "/api/auth/login", method: "post" },
          refresh: { url: "/api/auth/refresh-token", method: "post" },
          logout: false, //  remove the token from localstorage
          user: { url: "/api/auth/user", method: "get" }
        }
      }
    }
  },

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {
    baseURL: "http://localhost:8080"
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  }
}
