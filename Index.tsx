import Navbar from "./components/Navbar";
import HeroSection from "./components/HeroSection";
import ServicesSection from "./components/ServicesSection";
import ProjectsSection from "./components/ProjectsSection";
import ContactSection from "./components/ContactSection";

const Index = () => {
  return (
    <div className="min-h-screen bg-background">
      <Navbar />
      <HeroSection />
      <ServicesSection />
      <ProjectsSection />
      <ContactSection />
      <footer className="py-8 border-t border-border">
        <div className="container mx-auto px-6 text-center">
          <p className="text-sm text-muted-foreground font-mono">
            © {new Date().getFullYear()} · Built with passion
          </p>
        </div>
      </footer>
    </div>
  );
};

export default Index;
