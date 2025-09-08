# Illusion of Gaia: Retranslated - ROM Patcher

A React 19 web application for creating custom ROM patches of "Illusion of Gaia: Retranslated" with user-selected modules.

## Features

- **Project Data Fetching**: Automatically loads project configuration from Supabase API
- **Module Selection**: Dynamic form interface for selecting ROM modification modules
- **ROM Validation**: CRC32 validation ensures you're using the correct base ROM
- **ROM Building**: Integrates with GaiaLabs core package to rebuild ROM with selected modules
- **Error Handling**: Comprehensive error handling with user-friendly notifications
- **Responsive Design**: Works on desktop, tablet, and mobile devices
- **GitHub Pages Deployment**: Automated deployment via GitHub Actions

## Getting Started

### Prerequisites

- Node.js 18+ 
- npm or yarn
- A valid Illusion of Gaia ROM file (.smc, .sfc, or .bin)

### Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/Azarem/IOGRetranslation.git
   cd IOGRetranslation/site
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start development server**
   ```bash
   npm run dev
   ```

4. **Open in browser**
   Navigate to `http://localhost:3000/IOGRetranslation/`

### Building for Production

```bash
npm run build
```

The built files will be in the `dist/` directory.

## Usage

1. **Load Project**: The application automatically loads the "Illusion of Gaia: Retranslated" project data
2. **Select ROM File**: Choose your original Illusion of Gaia ROM file for validation
3. **Configure Modules**: Select your preferred options from each module group
4. **Build ROM**: Generate your custom ROM with the selected modifications
5. **Download**: Download the patched ROM file

## Project Structure

```
site/
├── src/
│   ├── components/          # React components
│   │   ├── ErrorBoundary.tsx    # Error boundary for crash handling
│   │   ├── ModuleSelector.tsx   # Module selection interface
│   │   ├── NotificationSystem.tsx # Toast notifications
│   │   ├── RomBuilder.tsx       # ROM building interface
│   │   └── RomFilePicker.tsx    # ROM file validation
│   ├── hooks/               # Custom React hooks
│   │   └── useProjectData.ts    # Project data management
│   ├── services/            # API services
│   │   └── supabaseService.ts   # Supabase integration
│   ├── utils/               # Utility functions
│   │   └── crc32.ts            # CRC32 validation
│   ├── types.ts             # TypeScript type definitions
│   ├── App.tsx              # Main application component
│   └── main.tsx             # Application entry point
├── public/                  # Static assets
├── .env                     # Environment variables
├── package.json             # Dependencies and scripts
├── tsconfig.json            # TypeScript configuration
├── vite.config.js           # Vite build configuration
└── README.md                # This file
```

## Dependencies

### Core Dependencies
- **React 19**: Modern React with latest features
- **@gaialabs/core**: ROM processing and generation
- **@gaialabs/shared**: Shared utilities including CRC32

### Development Dependencies
- **Vite**: Fast build tool and dev server
- **TypeScript**: Type safety and better development experience

## Deployment

The application is configured for automatic deployment to GitHub Pages via GitHub Actions.

### Manual Deployment

1. **Build the application**
   ```bash
   npm run build
   ```

2. **Deploy to GitHub Pages**
   The GitHub Action in `.github/workflows/deploy.yml` handles automatic deployment on push to main branch.

### Environment Variables

The application uses the following environment variables:

```env
VITE_SUPABASE_URL=https://adwobxutnpmjbmhdxrzx.supabase.co/rest/v1
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
VITE_PROJECT_NAME=Illusion of Gaia: Retranslated
```

Create a `.env` file in the `site/` directory with these variables. The Supabase URL and API key are used to fetch project data, while the project name filters the results to the specific translation project.

## Browser Compatibility

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the ISC License - see the LICENSE file for details.

## Acknowledgments

- GaiaLabs for the core ROM processing libraries
- The Illusion of Gaia: Retranslated project team
- React and Vite communities for excellent tooling
