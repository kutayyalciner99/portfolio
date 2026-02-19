import React from "react";
import { motion } from "framer-motion";
import heroBg from "@/assets/hero-bg.jpg";

const HeroSection = () => {
  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden">
      {/* Background */}
      <div className="absolute inset-0">
        {heroBg && (
          <img src={heroBg} alt="" className="w-full h-full object-cover opacity-40" />
        )}
        <div className="absolute inset-0 bg-gradient-to-b from-background/60 via-background/80 to-background" />
      </div>

      <div className="relative z-10 container mx-auto px-6 text-center">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, ease: "easeOut" }}
        >
           <p className="font-mono text-primary text-sm tracking-widest uppercase mb-6">
            Full-Stack Developer
          </p>
          <h1 className="text-5xl md:text-7xl lg:text-8xl font-bold leading-tight mb-6">
            Kutay{" "}
            <span className="text-gradient glow-text">Yalçıner</span>
          </h1>
          <p className="text-muted-foreground text-lg md:text-xl max-w-xl mx-auto mb-10">
            Mobile apps, web platforms, and end-to-end services — crafted with precision and shipped with confidence.
          </p>
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.3 }}
          className="flex flex-col sm:flex-row gap-4 justify-center"
        >
          <a
            href="#projects"
            onClick={(e) => {
              e.preventDefault();
              const element = document.querySelector("#projects");
              if (element) {
                const offset = 80;
                const elementPosition = element.getBoundingClientRect().top;
                const offsetPosition = elementPosition + window.pageYOffset - offset;
                window.scrollTo({ top: offsetPosition, behavior: "smooth" });
              }
            }}
            className="inline-flex items-center justify-center px-8 py-3.5 rounded-lg bg-primary text-primary-foreground font-semibold hover:opacity-90 transition-opacity"
          >
            View Projects
          </a>
          <a
            href="#contact"
            onClick={(e) => {
              e.preventDefault();
              const element = document.querySelector("#contact");
              if (element) {
                const offset = 80;
                const elementPosition = element.getBoundingClientRect().top;
                const offsetPosition = elementPosition + window.pageYOffset - offset;
                window.scrollTo({ top: offsetPosition, behavior: "smooth" });
              }
            }}
            className="inline-flex items-center justify-center px-8 py-3.5 rounded-lg glass text-foreground font-semibold hover:bg-secondary transition-colors"
          >
            Get in Touch
          </a>
        </motion.div>

        {/* Scroll indicator */}
        <motion.div
          className="mt-20"
          animate={{ y: [0, 8, 0] }}
          transition={{ duration: 2, repeat: Infinity }}
        >
          <div className="w-5 h-8 rounded-full border-2 border-muted-foreground/40 flex items-start justify-center p-1 mx-auto">
            <div className="w-1 h-2 rounded-full bg-primary" />
          </div>
        </motion.div>
      </div>
    </section>
  );
};

export default HeroSection;
