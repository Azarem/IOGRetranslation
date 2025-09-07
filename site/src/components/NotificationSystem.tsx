import { useState, useEffect } from 'react';
import './NotificationSystem.css';

export interface Notification {
  id: string;
  type: 'success' | 'error' | 'warning' | 'info';
  title: string;
  message: string;
  duration?: number;
}

interface NotificationSystemProps {
  notifications: Notification[];
  onDismiss: (id: string) => void;
}

export function NotificationSystem({ notifications, onDismiss }: NotificationSystemProps) {
  const [visibleNotifications, setVisibleNotifications] = useState<Notification[]>([]);

  useEffect(() => {
    setVisibleNotifications(notifications);

    // Auto-dismiss notifications after their duration
    notifications.forEach(notification => {
      if (notification.duration && notification.duration > 0) {
        setTimeout(() => {
          onDismiss(notification.id);
        }, notification.duration);
      }
    });
  }, [notifications, onDismiss]);

  const getIcon = (type: Notification['type']) => {
    switch (type) {
      case 'success': return '✅';
      case 'error': return '❌';
      case 'warning': return '⚠️';
      case 'info': return 'ℹ️';
      default: return 'ℹ️';
    }
  };

  if (visibleNotifications.length === 0) {
    return null;
  }

  return (
    <div className="notification-system">
      {visibleNotifications.map(notification => (
        <div 
          key={notification.id} 
          className={`notification notification-${notification.type}`}
        >
          <div className="notification-content">
            <div className="notification-header">
              <span className="notification-icon">
                {getIcon(notification.type)}
              </span>
              <span className="notification-title">
                {notification.title}
              </span>
              <button 
                className="notification-close"
                onClick={() => onDismiss(notification.id)}
                aria-label="Dismiss notification"
              >
                ×
              </button>
            </div>
            <div className="notification-message">
              {notification.message}
            </div>
          </div>
        </div>
      ))}
    </div>
  );
}

// Hook for managing notifications
export function useNotifications() {
  const [notifications, setNotifications] = useState<Notification[]>([]);

  const addNotification = (notification: Omit<Notification, 'id'>) => {
    const id = Date.now().toString() + Math.random().toString(36).substr(2, 9);
    const newNotification: Notification = {
      ...notification,
      id,
      duration: notification.duration ?? 5000, // Default 5 seconds
    };
    
    setNotifications(prev => [...prev, newNotification]);
    return id;
  };

  const dismissNotification = (id: string) => {
    setNotifications(prev => prev.filter(n => n.id !== id));
  };

  const clearAll = () => {
    setNotifications([]);
  };

  // Convenience methods
  const showSuccess = (title: string, message: string, duration?: number) => 
    addNotification({ type: 'success', title, message, duration });

  const showError = (title: string, message: string, duration?: number) => 
    addNotification({ type: 'error', title, message, duration });

  const showWarning = (title: string, message: string, duration?: number) => 
    addNotification({ type: 'warning', title, message, duration });

  const showInfo = (title: string, message: string, duration?: number) => 
    addNotification({ type: 'info', title, message, duration });

  return {
    notifications,
    addNotification,
    dismissNotification,
    clearAll,
    showSuccess,
    showError,
    showWarning,
    showInfo,
  };
}
