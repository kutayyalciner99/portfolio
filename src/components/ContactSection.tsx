import { motion } from "framer-motion";
import { Mail, MapPin, ArrowUpRight } from "lucide-react";

const ContactSection = () => {
  return (
    <section id="contact" className="py-20 relative">
      <div className="container mx-auto px-6">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="max-w-2xl mx-auto text-center"
        >
          <p className="font-mono text-primary text-sm tracking-widest uppercase mb-3">Contact</p>
          <h2 className="text-4xl md:text-5xl font-bold mb-6">Let's work together</h2>
          <p className="text-muted-foreground text-lg mb-10">
            Have a project in mind? I'm always open to discussing new opportunities and ideas.
          </p>

          <a
            href="mailto:kutayyalciner@hotmail.com"
            className="inline-flex items-center gap-3 px-8 py-4 rounded-xl bg-primary text-primary-foreground font-semibold text-lg hover:opacity-90 transition-opacity group"
          >
            <Mail className="w-5 h-5" />
            kutayyalciner@hotmail.com
            <ArrowUpRight className="w-4 h-4 group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-transform" />
          </a>

          <div className="flex items-center justify-center gap-2 mt-8 text-muted-foreground">
            <MapPin className="w-4 h-4" />
            <span>Available Worldwide · Remote First</span>
          </div>

          {/* Social links */}
          <div className="flex justify-center gap-6 mt-12">
            <a
              href="https://github.com/kutayyalciner99"
              target="_blank"
              rel="noopener noreferrer"
              className="text-sm text-muted-foreground hover:text-primary transition-colors font-mono"
            >
              GitHub
            </a>
            <a
              href="https://pl.linkedin.com/in/kutayyalciner/en"
              target="_blank"
              rel="noopener noreferrer"
              className="text-sm text-muted-foreground hover:text-primary transition-colors font-mono"
            >
              LinkedIn
            </a>
          </div>
        </motion.div>
      </div>
    </section>
  );
};

export default ContactSection;
