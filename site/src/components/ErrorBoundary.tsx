import { Component, ErrorInfo, ReactNode } from 'react';
import './ErrorBoundary.css';

interface Props {
  children: ReactNode;
}

interface State {
  hasError: boolean;
  error: Error | null;
  errorInfo: ErrorInfo | null;
}

export class ErrorBoundary extends Component<Props, State> {
  constructor(props: Props) {
    super(props);
    this.state = { hasError: false, error: null, errorInfo: null };
  }

  static getDerivedStateFromError(error: Error): State {
    return { hasError: true, error, errorInfo: null };
  }

  componentDidCatch(error: Error, errorInfo: ErrorInfo) {
    console.error('ErrorBoundary caught an error:', error, errorInfo);
    this.setState({
      error,
      errorInfo
    });
  }

  handleReload = () => {
    window.location.reload();
  };

  handleReset = () => {
    this.setState({ hasError: false, error: null, errorInfo: null });
  };

  render() {
    if (this.state.hasError) {
      return (
        <div className="error-boundary">
          <div className="error-container">
            <h1>Something went wrong</h1>
            <p className="error-message">
              An unexpected error occurred while running the ROM patcher. 
              This might be due to an incompatible ROM file, browser limitations, 
              or a temporary issue.
            </p>
            
            <div className="error-details">
              <h3>Error Details</h3>
              <div className="error-text">
                <strong>Error:</strong> {this.state.error?.message || 'Unknown error'}
              </div>
              {this.state.errorInfo && (
                <details className="error-stack">
                  <summary>Technical Details (Click to expand)</summary>
                  <pre>{this.state.errorInfo.componentStack}</pre>
                </details>
              )}
            </div>

            <div className="error-actions">
              <button onClick={this.handleReset} className="retry-button">
                Try Again
              </button>
              <button onClick={this.handleReload} className="reload-button">
                Reload Page
              </button>
            </div>

            <div className="error-help">
              <h3>Troubleshooting Tips</h3>
              <ul>
                <li>Make sure you're using a valid Illusion of Gaia ROM file</li>
                <li>Try using a different browser (Chrome, Firefox, or Edge)</li>
                <li>Clear your browser cache and try again</li>
                <li>Ensure your ROM file is not corrupted</li>
                <li>Check that your browser supports modern JavaScript features</li>
              </ul>
            </div>
          </div>
        </div>
      );
    }

    return this.props.children;
  }
}
