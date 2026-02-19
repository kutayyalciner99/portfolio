import { motion } from "framer-motion";
import { Smartphone, Globe, Server } from "lucide-react";

const services = [
  {
    icon: Smartphone,
    title: "Mobile Development",
    description: "Native and cross-platform mobile apps with seamless UX, built with React Native, Flutter, and Swift.",
    tags: ["React Native", "Flutter", "iOS", "Android"],
  },
  {
    icon: Globe,
    title: "Web Development",
    description: "Modern web applications and responsive sites built with cutting-edge frameworks and best practices.",
    tags: ["React", "Next.js", "TypeScript", "Tailwind"],
  },
  {
    icon: Server,
    title: "Backend & Services",
    description: "Scalable APIs, cloud infrastructure, and DevOps pipelines — from architecture to deployment.",
    tags: ["Node.js", "AWS", "PostgreSQL", "Docker"],
  },
];

const ServicesSection = () => {
  return (
    <section id="services" className="py-20 relative">
      <div className="container mx-auto px-6">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center mb-10"
        >
          <p className="font-mono text-primary text-sm tracking-widest uppercase mb-3">What I Do</p>
          <h2 className="text-4xl md:text-5xl font-bold">Services</h2>
        </motion.div>

        <div className="grid md:grid-cols-3 gap-6">
          {services.map((service, i) => (
            <motion.div
              key={service.title}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: i * 0.15 }}
              className="group glass rounded-2xl p-8 hover:glow-border transition-all duration-500"
            >
              <div className="w-12 h-12 rounded-xl bg-primary/10 flex items-center justify-center mb-6 group-hover:bg-primary/20 transition-colors">
                <service.icon className="w-6 h-6 text-primary" />
              </div>
              <h3 className="text-xl font-semibold mb-3">{service.title}</h3>
              <p className="text-muted-foreground mb-6 leading-relaxed">{service.description}</p>
              <div className="flex flex-wrap gap-2">
                {service.tags.map((tag) => (
                  <span
                    key={tag}
                    className="px-3 py-1 rounded-full text-xs font-mono bg-secondary text-secondary-foreground"
                  >
                    {tag}
                  </span>
                ))}
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default ServicesSection;
